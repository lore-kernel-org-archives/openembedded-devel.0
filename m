Received: from [74.125.78.149] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1M4jH6-00025u-2U
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 00:19:36 +0200
Received: by ey-out-1920.google.com with SMTP id 26so713042eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2009 15:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Oy8n7NUeqYGX0BG7W3jRcqT7fHST3+nlM7ZMuZBXuv4=;
	b=JjtPslrj6SzQl6JbRXAPjrhzQk1XZMJYKGzty41drjVnnNT27+nCuPOehxenjNHUbv
	5XLoU5R+ERUrOgOn0hNOdPhnupinQzwNwZgjOElkLxnplrax1uaDw1AJWhO52jMJyxP4
	NpwCk2fqqSbAA0pQp2+X3Vd2yvHtOrpwacE34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oTKwgLAmILP+4Bfegq6rh6XSywW590ruGvhu8rywrE2na54LR700LOCRQ/2WGCdYZ1
	INkKCnc9K5QRGq+NUFcoUWNtnXOn+V7FN+l9F1oZeMsN89PRpH2j5Or8OsRFieXCStFO
	hPc5r4lhi8j2C7pzsow7V0uehKTVxVzVUc3Rg=
MIME-Version: 1.0
Received: by 10.210.43.11 with SMTP id q11mr2784993ebq.37.1242339163379; Thu, 
	14 May 2009 15:12:43 -0700 (PDT)
In-Reply-To: <guhvju$ibq$1@ger.gmane.org>
References: <20090514144631.E363E1893D6@amethyst.openembedded.net>
	<guhvju$ibq$1@ger.gmane.org>
Date: Fri, 15 May 2009 02:12:43 +0400
Message-ID: <48239d390905141512xc4c995el68929d72efb7e632@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Sergey Lapin : AFEB9260 is not supported with 2.6.28-rc6 kernel anymore
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
X-List-Received-Date: Thu, 14 May 2009 22:19:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2009 at 12:40 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> GIT User account wrote:
>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 215a464bbd090a3e9c6344f78fd36c8074ce5537 URL:
>> http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3D215a=
464bbd090a3e9c6344f78fd36c8074ce5537
>>
>> Author: Sergey Lapin <slapin@ossfans.org>
>> Date: =A0 Thu May 14 17:12:34 2009 +0400
>>
>> AFEB9260 is not supported with 2.6.28-rc6 kernel anymore
>>
>
> Is it really "not supported" or you just prefer another kernel version?
> In the second case you can simply change DEFAULT_PREFERENCE_afeb9260 to "=
-1".
DEFAULT_PREFERENCE =3D "-1" is enough already (see near top of recipe).
>
> And BTW: as you seem to be the only user of this image, it seems you can =
just
> drop this rc kernel recipe completely.
I feel very bad about dropping recipes at all if not really necessary.

S.


