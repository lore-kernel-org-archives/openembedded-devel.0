Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1P2h7M-0004kU-DH
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 11:13:56 +0200
Received: by qyk35 with SMTP id 35so933507qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Oct 2010 02:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Tt+LM01jxy/Qo3YExBRJ8sas3wyVjROhk3t59yNpz6g=;
	b=OBOhFUPh/v9W0h38BZCnIzQx1JhoO/deNhihNP8vVeKVXB3OGUz9RZKHnE/vgXteYn
	HhykDJTC30CaLrOEMAwGO/vwN0RajaaWfO4iC2/StWUTMX1T9OdCwYfiAMyKjaKEbOUH
	gUNtRjQuVnMnOktU6w62rnPlFXJLrrP8ug+Cw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=g0wBH3oFgsZUVE01FppD0pbea93qeM7nHwFrKPRLBcfZHJaM4v9ZKco93pfLlLMjWC
	vGreDmdSgqvfl677lefpe9KPzrpFI8wITPPbEFuYqaOTqOguwFAuk6UzhwGXfkWaiZ0+
	a+ksYZY8tRDewerhUEtUebdL5rcZHS7vedw5k=
MIME-Version: 1.0
Received: by 10.224.89.11 with SMTP id c11mr6722636qam.43.1286183618086; Mon,
	04 Oct 2010 02:13:38 -0700 (PDT)
Received: by 10.229.34.194 with HTTP; Mon, 4 Oct 2010 02:13:36 -0700 (PDT)
Date: Mon, 4 Oct 2010 11:13:36 +0200
Message-ID: <AANLkTinpLXC9tZ0viEHhYPzjBt=0+nG6eRdrw2Ur1ey7@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: OpenEmbedded Mailing List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: trouble building gcc-cross-initial first time
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
X-List-Received-Date: Mon, 04 Oct 2010 09:13:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

When building an image for one of my devices for the first time,
bitbake always seems to have a problem with building
gcc-cross-initial. It has the following error:

| In file included from
/home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/sparseset.c:22:
| /home/jan/src/prodata_openembedded/build/tmp/armv5te/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.3.3-r13.1/gcc-4.3.3/gcc/system.h:418:
error: conflicting types for 'strsignal'
| /usr/include/string.h:564: note: previous declaration of 'strsignal' was here

However, when I restart the exact same bitbake command, the build
continues without a problem.

I run massive parallel builds with 8 bitbake threads and make -j 8, so
I suspect that this has something to do with it. One of the tasks the
is started before is linux-libc-headers_2.6.31.bb, do_package_stage.
Could it be that this task hasn't finished yet while the
gcc-cross-initial needs it?

Regards,

Jan


