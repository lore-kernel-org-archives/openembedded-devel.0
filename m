Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PqAJM-0000q8-4s
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 21:18:48 +0100
Received: by fxm17 with SMTP id 17so2844099fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 12:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=BoDO2sXr5XJvpPgHhYhbE/n8cJF38yJaYsUKGTzeuEk=;
	b=WLIKVGV+YuZQrG+ZTN7HQzgGRyw5/uRSulv+93jY03zjY5yM6ZQuXUnOFA5ckBlNIo
	vI0uUzjxCxvuqEJY0W8Elml+MNQ+6wg/71xlqnFIgYT3r34q5qR7exlVitCrTBuDdJNx
	rR3hOHWaXVo9mptB1XL0sjlsp8vfx69weBD1Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=lZVaZKm/8F6dvVSdN/2toagMKUMCAHEV3azhOJEzBsb19TU+QqsXAAgky+tTTmLuyp
	u/Vje72HR1wMqLmPfPICDk0h/JgX5JaTBsTftIa9u2WtK8i25frFEBzel4/qVWLjAUq8
	G38YwkVpAdcF7OjqYsH2ph3eHmbVCMhYOPC+k=
Received: by 10.223.79.14 with SMTP id n14mr576451fak.19.1297973774418; Thu,
	17 Feb 2011 12:16:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.114.73 with HTTP; Thu, 17 Feb 2011 12:15:43 -0800 (PST)
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 17 Feb 2011 13:15:43 -0700
Message-ID: <AANLkTinKjwaC=aqTE2ouKF1VN-iHccUdOSwLG7CnV=ET@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: is there a virtual/sysvinit to prevent hard-depends on sysvinit?
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
X-List-Received-Date: Thu, 17 Feb 2011 20:18:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is there a virtual/sysvinit?

task-proper-tools depends on sysvinit, which conflicts with upstart.

How could I specify that it should depend on a virtual package?

AJ ONeal

