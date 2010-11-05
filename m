Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1PEW9T-0003P3-Dn
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 00:57:22 +0100
Received: by eya28 with SMTP id 28so2146267eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 16:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:reply-to:mime-version:content-type:content-disposition
	:user-agent; bh=2es4Pq6MrtbPY6X5YCsRKbvV9QY1+oLpgb/yJWJ3n8Q=;
	b=TG3b7aM7AEUzcHApoTCKWxAf+X5y0RlxMLF5lHTkfIRnebbRdXWDCUH7i6nTceWK6d
	81QcY3+QC/3MXoPTXxnlpfKx+5TvCU8/izxqfZmu00FS2BCftZYbs7KqYztX96Lr2WfZ
	ikG8Z6dh+08YeAQ+6wiTprnZrf2JNl2IwYvxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:reply-to:mime-version:content-type
	:content-disposition:user-agent;
	b=lYg7uCTSYgJ/2RX1P4pwBvWd93bnaRRb/weZZrUpYxmwHKcE8y5/dC6sWAfXQD75F5
	RkGXkamYAzGLKdzq1IaqhmgH/DiZsb6YG+0dsRezwtgnn5oPm0K2HWsVZDeDX9xuCZaK
	m2zBTCqgHhD85MGCi/IOHwM1dbn6ybT4GpyNU=
Received: by 10.213.34.68 with SMTP id k4mr2162706ebd.88.1289001367381;
	Fri, 05 Nov 2010 16:56:07 -0700 (PDT)
Received: from localhost (c-e3dee555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.222.227])
	by mx.google.com with ESMTPS id q58sm1579181eeh.9.2010.11.05.16.56.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 16:56:06 -0700 (PDT)
Date: Sat, 6 Nov 2010 00:56:00 +0100
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101105235600.GA3671@boggieman.bredbandsbolaget.se>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kristoffer.ericson@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ARMv4 not working with latest gcc,eglibc
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
X-List-Received-Date: Fri, 05 Nov 2010 23:57:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

Khems addition of gcc 4.5 patch effectivly removed the thumb 'bx' instruction from
the binaries, but Im getting the exact same issue as before (kernel panic at init time).

Filip zyzniewski had the combination of gcc 4.4.2 + eglibc 2.12 working well on his machine,
I also know another person with an ARMv4t which used gcc 4.5 + eglibc 2.12 without any issues (with same distro file).
Therefore I still believe its an compiler/thumb issue. 
Im currently trying to reproduce filips environment to make sure, once I do it should be confirmed.

Best wishes
Kristoffer Ericson
http://www.jlime.com


