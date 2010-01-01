Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ahsan.khwaja@gmail.com>) id 1NQbKz-000144-TA
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jan 2010 07:50:21 +0100
Received: by pwi18 with SMTP id 18so8223121pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2009 22:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=31SIyUqj9g06T0To9JrZb9214fIJa9KdEeepziwa/SE=;
	b=VRwGQYLRCYWewz3udGOVK54DQxk4V++A4PjZMcMstshNBx1Yd75Ou7XKu2PtHjCX6O
	NPhKjmbzRLdnREWK9oDn6iK9ExCwuWEt8VrKmyrnW33XV1I4MT6+czNdeqeyNqAEEL7f
	9H9P03OMA+UlfkzSap+cjFyD76WuLR+1w5w/8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qjqsGSWYLDKI5pkebQcPABqjnll3hOFwfppGhG3oZW64pUG15EHtlxkSJXFklypL5I
	htfjAP6hw3WyPI/gfYF059PlIb/SBShhpRQvlRRs3Ur1SOxaXJ//L1fDb+DqjvYGnark
	1bohYcdn7usADR81+shZ2UboT6jtdxKy3Lz9c=
MIME-Version: 1.0
Received: by 10.115.103.7 with SMTP id f7mr12281210wam.1.1262328497186; Thu, 
	31 Dec 2009 22:48:17 -0800 (PST)
Date: Fri, 1 Jan 2010 11:48:17 +0500
Message-ID: <818ccfc40912312248w6cbab38eo600057cd5a9b485e@mail.gmail.com>
From: Ahsan Khawaja <ahsan.khwaja@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: ahsan.khwaja@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem in configuring Newlib while building GCC cross compiler
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
X-List-Received-Date: Fri, 01 Jan 2010 06:50:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I am building newlib library instead of eglibc using openembedded. I divided
newlib package in newlib-initial-version and newlib-version. I added
gcc-initial dependency on newlib-initial-version. I am having problem while
configuring newlib-initial. When its configure script runs it give me error
"checking C compiler works ... ld could not found crt0.o". I did not see any
kind of such thing in eglibc configure script. Please help me in resolving
this issue. I dont see any crt0.o file while compiler has place at time of
configuring newlib-initial package.

I have few confusions here. What is the different between eglibc-initial and
eglibc package and should I do the same for newlib package. Secondly why GCC
is divided in different packages gcc-cross-initial, gcc-cross-intermediate
and gcc-cross. what is the difference between these packages. Please help me
in understanding these things. Thanks.

regards,
Noor

