Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NViR6-0003Eo-P5
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 10:25:47 +0100
Received: by pxi9 with SMTP id 9so380081pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 01:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=v9Y3dIXfUsg8rLq6LgmZvdCxMa1Fxa2UBJsFkNN0slM=;
	b=Nnp/r1xBMIr3T0dfVChKYrAONOV0ZMImygficQPtEZxKNdV5clhighn8WkF12Trl0/
	9NaFkqkBpFyRMk2vvUWmxf9/tKQzm+3d6YJt+VNtzGXG96BWHsbRYGy4uSDBO2I/Fe2h
	jrgBow5C6N8KtKu2r0P3zcRX8dbXKXlPD+3T8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=itJHEc8LuxukSmcll0IOkqWkIW6w9cBQMaQdt9iq0HDtsOpagyKRFdwUkfndh0vIuW
	KG7mRjmEjbTsjhR3ynniOWTngtkkFe790QfTMJC9RVsiB757kdJ+kmhN3Rgor3wdemhQ
	PxQmHkivV2vpFQRM/T4p5aoAiQ2yTConiCfO4=
Received: by 10.141.90.17 with SMTP id s17mr1537049rvl.196.1263547412108;
	Fri, 15 Jan 2010 01:23:32 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.24])
	by mx.google.com with ESMTPS id 20sm1275471pzk.9.2010.01.15.01.23.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 15 Jan 2010 01:23:31 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <20100114195301.GA3529@gmail.com>
	<op.u6jv0uycmn1qzu@guohr-laptop-ubuntu>
	<201001150733.59792.marcin@juszkiewicz.com.pl>
	<hip8ml$2mq$2@ger.gmane.org>
Date: Fri, 15 Jan 2010 17:23:22 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6kho8d7mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <hip8ml$2mq$2@ger.gmane.org>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Fri, 15 Jan 2010 09:25:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Fri, 15 Jan 2010 16:23:50 +0800=EF=BC=8CKoen Kooi <k.kooi@stud=
ent.utwente.nl>  =

=E5=86=99=E9=81=93:

> Or you can just use angstrom, which has all that magic already

Yes, I found it several days ago. But the question is that angstom have =
 =

not add ${LIBC} to ${TMPDIR}/stamps and ${TMPDIR}/pkgdata. If I just wan=
t  =

to build target images, it is enough. But I want to do incremental  =

building, so I have to keep the stamps and pkgdata within different  =

directories.

-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


