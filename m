Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NDyOV-0000Jg-EN
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 11:49:46 +0100
Received: by fxm8 with SMTP id 8so1281438fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 02:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=aEyuFlPcG7/ZS1sKZpUknksJK5vamn6b9JhVjkrG6xI=;
	b=Dh6lniinfUADaFNld8lgFTCnrDYZpHf7uXo+w2y4dySuAB+HPKvM0wBbMvXm+Qoif4
	T6qST+k+iKEOGv+/AxZTMKmuAXz6wHWToAOzEFKp/ETJ1eU36YT/DmsNbU09h51J9Eh9
	T1YXEUXeNHxLLhHCD4ukCIC8Fb6ZyHTKmRh/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=a3sRVc4HRZyg4B/9ZDkJzQyDSrg5enLOlaS0YCY0ZZygwP0wTe+5SyYZnpth3gihmy
	3YyV5ysanmXNDi1eY8FhJcb4KzE+S8mwdYTFXfdTzTnPynN3ga+d+nqABOkbbpY9mLaP
	bRW9q0+KUXyYxIQopeduUcAyQxillW4MAoN50=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.145.129 with SMTP id s1mr89689hba.45.1259318892210; Fri, 
	27 Nov 2009 02:48:12 -0800 (PST)
In-Reply-To: <ae9c9a1c0911261845m6a81efcblf372b4409fcc1185@mail.gmail.com>
References: <ae9c9a1c0911261845m6a81efcblf372b4409fcc1185@mail.gmail.com>
Date: Fri, 27 Nov 2009 08:48:12 -0200
X-Google-Sender-Auth: a94d71a7fcd87459
Message-ID: <be7a9f3d0911270248r3d2e75ffibe3cc71248d61a9e@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mamona: classes and configs for fist review
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
X-List-Received-Date: Fri, 27 Nov 2009 10:49:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Ricardo,

On Fri, Nov 27, 2009 at 12:45 AM, Ricardo Salveti de Araujo
<ricardo.salveti@openbossa.org> wrote:
> Hello all,
>
> I just created a branch in gitorious with mamona patches related with
> classes and configs, for first review.

The changes looks good to me at least. One thing that I'd interesting
to know is how are you using the PRODUCT setting and what use cases
you've been solving with it.

The only cosmetic thing that you might change is to reorder the patch
that introduces PRODUCT in bitbake.conf and the distro change to allow
for easier understanding of where it come from.

Cheers,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


