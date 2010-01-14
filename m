Received: from qw-out-1920.google.com ([74.125.92.149])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVPh8-0005Lm-KD
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 14:25:05 +0100
Received: by qw-out-1920.google.com with SMTP id 14so691289qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 05:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:date:subject
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=CHBY3Ol/ESVHZ0NbimKNNFXZfQHitd8YCPfrCOA+pgE=;
	b=I7nnrJfvvRNTn7G36yM2RZn76K0MyE0qDy3RZPkkUKpcW3nmsXVM4aUku80J+wR+g+
	tn6R9EP77EB0+W0rYiOrdDVlIC4qOnU2LFHtnJupdlnLLuTG4lRbHf1q6QMwLhfAZc7W
	bPhQkRIpYHg4lbdzbFr85/kFzteWCGp6eBubo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:date:subject:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=xKsq5nS0Y+pCOnO9Ik38ooAOM9lJN0Dry4sVdNHLuqMfBFEkmPi4siX+/t31r4LyAR
	L2d0Z+jCQ7W4eiuP1XigNq9kRo7oZlLDvhlWesFnrx6zv/SgRw/mzW7INx48Ul+dHdqv
	LhGJanjl9veQyrjEBhEyO9EIMoIEeSFsC5TQk=
Received: by 10.224.73.36 with SMTP id o36mr542750qaj.369.1263475373061;
	Thu, 14 Jan 2010 05:22:53 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.75])
	by mx.google.com with ESMTPS id 9sm136871ywe.41.2010.01.14.05.22.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Jan 2010 05:22:52 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Jan 2010 21:22:41 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6ix3rd6mn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: rm_work.bbclass causes the incremental building impossible
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jan 2010 13:25:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I want to do incremental building when openembedded recipe changes. But  
I found that when adding INHERIT += "rm_work" in local.conf, bitbake  
always building lots of packages which recipes never were changed. I  
verified it with the newest openembedded  
667b7cb389a4cd8677fe5272f16c0d31bd77a4da


After adding INHERIT += "rm_work", the second building will delete lots of  
stamps files. I don't know why.
camelguo@guohr-laptop-ubuntu:/opt/workdir/oe/build/gulessoft-oe-standard-conf$  
bitbake shasum-native
NOTE: Handling BitBake files: - (7967/7967) [100 %]
NOTE: Parsing finished. 7327 cached, 311 parsed, 329 skipped, 0 masked.
NOTE: oestats: build 52017
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Removing stamps:  
/media/work-disk/workdir/allinone-test/stamps/i686-linux/shasum-native-1.0-r1.*
NOTE: Running task 1 of 65 (ID: 1,  
/opt/workdir/oe/openembedded/recipes/shasum/shasum-native.bb, do_setscene)
NOTE: Running task 2 of 65 (ID: 2,  
/opt/workdir/oe/openembedded/recipes/shasum/shasum-native.bb, do_fetch)
NOTE: Running task 3 of 65 (ID: 4,  
/opt/workdir/oe/openembedded/recipes/shasum/shasum-native.bb, do_unpack)

Without INHERIT += "rm_work", the second building will delete nothing,  
which is what I expected.
camelguo@guohr-laptop-ubuntu:/opt/workdir/oe/build/gulessoft-oe-standard-conf$  
bitbake shasum-native
NOTE: Handling BitBake files: - (7967/7967) [100 %]
NOTE: Parsing finished. 7327 cached, 311 parsed, 329 skipped, 0 masked.
NOTE: oestats: build 52008
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Tasks Summary: Attempted 15 tasks of which 15 didn't need to be  
rerun and 0 failed.

Any advice is welcome.

Thanks a lot!


-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


