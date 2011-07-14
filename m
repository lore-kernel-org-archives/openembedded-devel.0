Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QhEHF-0000Ep-K4
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 07:15:57 +0200
Received: by fxh10 with SMTP id 10so411997fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 22:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WKO/Xh0h1bRJ5/30QGcyJlPQYDq/Q9NHscMlpf+V8uA=;
	b=qlwDhuobcln8nKLnvTCIkmPv3DV82ggHuv/HLf7ZBpJXPcxNKLQKadfF2su9DVRHCh
	xoVCLXSzrerk35/5KioCsYJaAKNX4tpVQBZj1psGshYGY254+F2dtYEVrFmaU8VdtCdZ
	buq9WU2mOvZ0AdvYWH6yHYh3ptAvspkSvno1s=
MIME-Version: 1.0
Received: by 10.223.43.1 with SMTP id u1mr2977676fae.38.1310620318600; Wed, 13
	Jul 2011 22:11:58 -0700 (PDT)
Received: by 10.223.97.65 with HTTP; Wed, 13 Jul 2011 22:11:58 -0700 (PDT)
Date: Thu, 14 Jul 2011 00:11:58 -0500
Message-ID: <CAD=GYpaPsH_ZJ9=bLpk+ff43m9CzH4fdKYE2BS1a6E=KU9wnCA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: ghostscript 9.01 fails to build
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
X-List-Received-Date: Thu, 14 Jul 2011 05:15:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

When OE build gets to the gs-9.01 recipe (ghostscript), it breaks in
the do_configure stage.
I'm using org.openembedded.dev HEAD,
Here are the logs for the configure stage:
http://www.utdallas.edu/~joel.fernandes/log.configure.gs-9.01-r0

The missing headers and libraries seem to be coming from the
fontconfig recipe (recipes/fontconfig/fontconfig_2.8.0.bb) and I think
it lacks a particular do_stage function that should copy the
libraries/headers for ghostscript to pickup.

Is my analysis correct? Has anyone experienced a similar issue?

Thanks for any help,
Regards,
Joel


