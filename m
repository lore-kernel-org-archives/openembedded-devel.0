Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NjzxJ-0005cU-Hd
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 19:58:04 +0100
Received: by fxm20 with SMTP id 20so3842034fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=A1UJQVODOed3cGkIwEKtrlPqro/LwsRxTDaNaxGljps=;
	b=qgKasFUiUgqslaFIxI+a1PJJ/EVZcPV4a2DCzfTe0HLDhsnHLxtIJOB4QwIDcPcal5
	9g504Kr87c4YN1gB2YwKLA5dbLzL+AZ2knDA5B06NytzNtrkQz7T44SSgVegJiYdADig
	YZc+lY8DuyXluZa/1azxiWjnlf40o3xdcGLgA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=ncOo23p3BxEq+wMe/QieeZGpqJZgUzWATO7l4gf2+E0CmKGbofIVlvfX3qXordtjoz
	Av8noj0bfYxf5XSMgYjaBA+VI/+4ZVl/miwkmW1fA/W/vQyNGjE+jjmlalcg+XKhvgm2
	BqtMaUUMmD7rw/iHW5n7gPzI810ZJ67R8C6DQ=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.160.131 with SMTP id c3mr1875381hbd.119.1266951316806; 
	Tue, 23 Feb 2010 10:55:16 -0800 (PST)
Date: Tue, 23 Feb 2010 15:55:16 -0300
X-Google-Sender-Auth: f03ffa8b1d13292b
Message-ID: <be7a9f3d1002231055n5783b939j7d7d75081efdaa2a@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Kernel image stagging [was Re: [PATCH] kernel.bbclass: Stage the raw zImage and modules tarball for inclusion in pstage
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
X-List-Received-Date: Tue, 23 Feb 2010 18:58:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Chris and others,

Your patch looks fine however this has made me thing another issue.

For me, it looks like the image ought to have be grabed from the package, at
image building time, not at kernel package building time.

This solves a problem when we remove the image deploy dir and then need to
rebuild the kernel package to get the image there again.

Do you think it makes sense?
-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br

