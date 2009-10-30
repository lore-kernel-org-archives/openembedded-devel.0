Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N3vLf-0006R0-4X
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 18:33:18 +0100
Received: by ywh7 with SMTP id 7so2943485ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 10:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5vQSvm7Mpa2/NhxOHz0MySxSIo6VkHw9EwgZjcmYt/U=;
	b=KFRyo6uzPp/4dqG4n8aiCV+en3iFT5IID2AiDThyyuwRcQHFYFUWMrwJWFZPCO+GWc
	cLxHG+3OdkullDR0OrBcOshDDTGrWC+roowHN+oLxg76qSGLy6JApxuIL0qojm0V0/4q
	3/niXDYz1EIMyZGoRLMwEhWihYSmb1vZF4mbY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=to6LEamy5Hsb6Hn6Xy2av//cmhmOmZk7EMqXnlzaHtzAQ+O2cXJe8lCkyz9WApYr+y
	aMi/+27MvZpUkQseORqMEDKOmKxO43lewnhIIZ3RWZyDm4y7oYUMMIsAF0B4CtLsr14Z
	AHZUEXL+K3pIMv/07maBV7cMF5jDtRff/2A7U=
MIME-Version: 1.0
Received: by 10.101.155.22 with SMTP id h22mr2037006ano.58.1256923926257; Fri, 
	30 Oct 2009 10:32:06 -0700 (PDT)
In-Reply-To: <hcf53t$4jp$1@ger.gmane.org>
References: <ac9c93b10910300040v779f8446k31de3dfc2b2fe298@mail.gmail.com>
	<hcf53t$4jp$1@ger.gmane.org>
Date: Fri, 30 Oct 2009 18:32:05 +0100
Message-ID: <ac9c93b10910301032s160461bv2c1ddf5a2a7736ec@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: about staging
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
X-List-Received-Date: Fri, 30 Oct 2009 17:33:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/10/30 Koen Kooi <k.kooi@student.utwente.nl>:
> On 30-10-09 08:40, Frans Meulenbroeks wrote:
>>
>> Hi,
>>
>> Yesterday I ended up in a discussion on staging in #oe (ok, ok, I
>> mainly caused the discussion :-) )
>> Also based upon that I looked at various recipes on how people
>> implement staging.
>>
>> There does not seem to be really standard way.
>> Some recipes copy from ${S} which ihmo is not desirable; i think it
>> should be a file that is exported by the application).
>> Others use other mechanisms.
>>
>> For my own recipe I ended up with something like:
>>
>> do_stage() {
>> =A0 =A0 =A0 =A0 install -d ${STAGING_INCDIR}
>> =A0 =A0 =A0 =A0 install -d ${STAGING_INCDIR}/${PN}
>> =A0 =A0 =A0 =A0 install -m 0644 ${D}/${includedir}/${PN}/*.h
>> ${STAGING_INCDIR}/${PN}
>> }
>>
>> as that seems the best. ${D} contans the exported/installed files from
>> the application. Those files are the ones the application wants to
>> make externally available and those should end up in staging. Not
>> something from ${S}.
>
> Is ${D} garanteed to be present at staging time? I don't think we have a
> current hard rule for that.

${D} =3D install subdir, so in my case it is definitely there.
but it might be absent in the generic case (e.g. in case of an empty packag=
e)
A solution which automates everything should take that into account
(if ${D} does not exist: no action))

Btw: as a starter I would already be happy with some scripting that
allows easy copying from ${D} to staging

(and I hope you agree with me that copying from ${S} to staging should be a=
 no)

Frans


