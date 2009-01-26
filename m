Received: from [64.233.170.190] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LRW3M-0004ma-HB
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 19:19:20 +0100
Received: by rn-out-0910.google.com with SMTP id j42so1779324rne.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 10:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=mFa1az8n5BZkRw7Q9EUwDZ0g8WTW8TWtehvck5SvOFE=;
	b=NAcBxkI4KuSNl03rf3mkyPZJYhL8a/njYk4pREYCNXWDFpUqJDZBEL125bWumrIKBh
	kkhal9D1BNkvePkg32LDDmF4j6fr73zJgwSqQ2ndJIjGBfXgLMxr3kztvapSqJmM1uue
	EuLUDVSy97858+tslbSr+8aZlXixupA7q42Sc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=W3kjrB/lVVHG4Z06ATe+eWPPy2XkdK/f7beoF03AdZPSU/uzFm5SkQ/12hpWJklSVo
	YkkiUiN+dCEYpUqkY4FI8EN3l2ghir5TSdZQIydzUmx/oxyxQFuk/X16iA3DcKZst2kO
	f/vOKKo894R13LTqBUdFiQUOh2OymTL/h6KMs=
MIME-Version: 1.0
Received: by 10.150.154.6 with SMTP id b6mr806785ybe.218.1232993511624; Mon, 
	26 Jan 2009 10:11:51 -0800 (PST)
Date: Mon, 26 Jan 2009 13:11:51 -0500
Message-ID: <f96d234e0901261011x1708a5cbra3334ceb18821f08@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: rm_work and building kernel modules
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
X-List-Received-Date: Mon, 26 Jan 2009 18:19:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm noticed a little glitch with rm_work and building kernel modules
with OE.  Typically, kernel module builds require the kernel source to
be intact, which gets removed if rm_work is enabled.  I'm wondering if
we should make a way to suppress rm_work for kernel recipes, or is
this just one of those things people need to live with?  If so, any
thoughts on the best way to implement?  A hackish way would be to
check a variable in do_rm_work() and not remove directories if
INHIBIT_RM_WORK is set.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


