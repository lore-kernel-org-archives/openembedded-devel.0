Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1NwGUv-0005TQ-05
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 17:03:25 +0200
Received: by wwb13 with SMTP id 13so1856854wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 08:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:received:message-id
	:subject:from:to:content-type;
	bh=IDpc2Q8V7C2eKWAE47vNluwi+Mp6gbFRyrEAyzITjzA=;
	b=e3+jvmQ9ksHBLUqOTIYq0zcnteoILBQnU2J3I7Z5dPZ1tx90MxPG8z6a1Zfgns5ITs
	iuXGagA8E1DR0YETuUKpdXWRM8VwhHDewwWND10PqqJ2PNX5Kysj7Otz9v9gdnz2gZdl
	6Tyzs5ope2TaISzkeHkxWSPRrPLZFU1odW6Pg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=i9gFdHPfTNiTCQnCdxhh3vec11GLVLkf+OFjlY6OtYOj9adzvOhP7HSu96FCC4sb1a
	Des+wxkQ+B5bFK1UfCrmqaMn57iChV5FVXDfZVt8e+ua9B0jfywkkJgVh/Fqa+g7MVdi
	/Jk1Q8BiQ5Lq4QI40uwNweH9LLbzLSInrhwqs=
MIME-Version: 1.0
Received: by 10.216.160.15 with HTTP; Mon, 29 Mar 2010 08:00:10 -0700 (PDT)
Date: Mon, 29 Mar 2010 19:00:10 +0400
Received: by 10.216.171.7 with SMTP id q7mr80709wel.40.1269874810891; Mon, 29 
	Mar 2010 08:00:10 -0700 (PDT)
Message-ID: <48239d391003290800n4c75b539t1b89a96212edb971@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: profiling versions of libs (glibc in particular)
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
X-List-Received-Date: Mon, 29 Mar 2010 15:03:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

How hard could be to generate -pg versions of packages in addition to -dbg ones?

And, also - if that is too far - how could I generate profiling
version of glibc,
which is most important for me now?

As I see, profiling is disabled with current version of libs with
--disable-profile,
but I don't see this option to have any effect on libraries, generated
by bitbake glibc.

Is there some simple hack to move forward?

Thanks a lot,
S.


