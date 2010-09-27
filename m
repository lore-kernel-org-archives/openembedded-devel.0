Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0EUu-0002DD-D2
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 16:16:06 +0200
Received: by iwn2 with SMTP id 2so2999490iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=8REWPQ1jUlz+EolwbppIMaoWQCi2AxR/p4AXEo3x8Lk=;
	b=Ol28wHQb4BlBwL3Mhd9smF9HQNV0VjNBT/OyMMborNyHyPLE4d6FBJ+Up1Z86me034
	lKJEz9x10rvBJhbV5w82R6sPWj7LyieaeiC83kWTvpaLf5YhWzllZUjkO1L3OOJm+gsL
	fakUfE9IC1ty+zkS2/SuMvPScUII56avyIZNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=CrM5YUDdxvoZG7RXdvdFeYr+c24b6ePK1I3gNAyc8Ih9bGg51f5uAvK/rozvRj7jce
	Fe/PheMo3JkCXbaDW3mwRLItijUhRTlsI+0VLcXws9aqYJrAsEpadti83s3Ps9/g79uy
	/i32yFusrUUNdqIZSgiQD7IxAIGA0ztamlD0I=
MIME-Version: 1.0
Received: by 10.231.179.24 with SMTP id bo24mr6302076ibb.193.1285596951343;
	Mon, 27 Sep 2010 07:15:51 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 27 Sep 2010 07:15:51 -0700 (PDT)
Date: Mon, 27 Sep 2010 16:15:51 +0200
Message-ID: <AANLkTik0gS3dcnz++jr9pF-fh1ATt-f46hzGNHfbV+VU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: multiple kernels and images
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
X-List-Received-Date: Mon, 27 Sep 2010 14:16:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm faced with the following problem:
I need two kernels for my machine. One kernel will be a lightweight
kernel (to reduce loading time) which boots then flashes the real
kernel to NAND.

To create two images I tricked a little bit and created two recipes
(using require of course).
As these have different names (linux-A_2.6.34.bb and
linux-B_2.6.34.bb) I can give them different dirs and different
defconfigs
(linux-A/defconfig resp linux-B/defconfig).

So far so good, but how do I now get the right kernel in my sd card image.
Basically both recipes create a package kernel, so adding kernel to
the image does not work.
Anyone an idea on how to fix this?

Additional remarks:

I'm aware of multi-kernel.inc but that still seems to leave me with
the problem how to add the kernel to my image

I can also create a 2nd machine in which case maybe things can be made
to work, but that seems a fairly ugly hack (and still might give me a
selection problem).
Hence looking for a better solution.

BTW wouldn't it be better to have the linux recipes package things
(also?) in linux-A_2.6.34-r1_${MACHINE}.ipk or something like that
instead of kernel_2.6.34-r1_${MACHINE}.ipk.
Then an image could explicitly state the kernel recipe it wants to use
(and virtual/kernel could be used to specify the default kernel).

Your ideas/feedback is appreciated.

Thanks alot!
Frans.


