Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NMs2z-0006VC-9C
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 00:52:20 +0100
Received: by iwn32 with SMTP id 32so3573184iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 15:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2GKYtSAM+wikA8QQUUizeL6EYJhxlwcZEYZ3ohMBtT0=;
	b=K/8wYY6rzxb/XRT1GSmD51bEtVpkygA0ncQdlw6QemWlPjyBgONpa9y/EV+7awaXHH
	hw7ZQJBlCQrnkYBjal69CcEfhuJtnp+MTAOOc9CM9+kvkhLXfMJuYuZO2m7u8gEo8cRG
	YexWyXOdSxenZ+fI3z2egfjoyZBd0bVy27Y6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iEGquqVZHtxf6l9PfhAGMvk1omE3S/eXjMqV69XqKAT+iMKrtp8WT26drjwORPCiiQ
	PzXtnMfD9RiGNklryD9ThCwiDVvaSegYTfxRXObnHqdayaKnzVF3uFKZYmUqvAotEwWJ
	toaKT2M/RRXp+gIKx5/v2d7KPZU1SjDg8hhkU=
MIME-Version: 1.0
Received: by 10.231.170.14 with SMTP id b14mr4394758ibz.26.1261439425117; Mon, 
	21 Dec 2009 15:50:25 -0800 (PST)
In-Reply-To: <1260868213-26276-1-git-send-email-camelguo@gmail.com>
References: <1260868213-26276-1-git-send-email-camelguo@gmail.com>
Date: Mon, 21 Dec 2009 15:50:25 -0800
Message-ID: <19c1b8a90912211550s100d6fapb16acf65d9c4e2a7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Enable --ignore-deps options to access regular expression string
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
X-List-Received-Date: Mon, 21 Dec 2009 23:52:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2009 at 1:10 AM, Guo Hongruan <camelguo@gmail.com> wrote:
> 1. Add a function named re_match_strings(target,strings), to match
> =C2=A0 target using the string in strings which can be regular expression
> ---
> =C2=A0lib/bb/taskdata.py | =C2=A0 21 +++++++++++++++++----
> =C2=A01 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/lib/bb/taskdata.py b/lib/bb/taskdata.py
> index 45f6902..3935e09 100644
> --- a/lib/bb/taskdata.py
> +++ b/lib/bb/taskdata.py
> @@ -26,6 +26,19 @@ Task data collection and handling
> =C2=A0from bb import data, event, mkdirhier, utils
> =C2=A0import bb, os
>
> +def re_match_strings(target, strings):
> + =C2=A0 =C2=A0"""
> + =C2=A0 =C2=A0Whether or not the string 'target' matches
> + =C2=A0 =C2=A0any one string of the strings which can be regular express=
ion string
> + =C2=A0 =C2=A0"""
> + =C2=A0 =C2=A0import re
> +
> + =C2=A0 =C2=A0for name in strings:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (name=3D=3Dtarget or
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re.search(name,t=
arget)!=3DNone):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True
> + =C2=A0 =C2=A0return False
> +
> =C2=A0class TaskData:
> =C2=A0 =C2=A0 """
> =C2=A0 =C2=A0 BitBake Task Data implementation
> @@ -262,7 +275,7 @@ class TaskData:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 """
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 unresolved =3D []
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for target in self.build_names_index:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if target in dataCache.ignored=
_dependencies:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if re_match_strings(target, da=
taCache.ignored_dependencies):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.build_names_index.index=
(target) in self.failed_deps:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
> @@ -277,7 +290,7 @@ class TaskData:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 """
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 unresolved =3D []
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for target in self.run_names_index:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if target in dataCache.ignored=
_dependencies:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if re_match_strings(target, da=
taCache.ignored_dependencies):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.run_names_index.index(t=
arget) in self.failed_rdeps:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
> @@ -357,7 +370,7 @@ class TaskData:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 added internally during dependency resolution
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 """
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if item in dataCache.ignored_dependencies:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if re_match_strings(item, dataCache.ignored_=
dependencies):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not item in dataCache.providers:
> @@ -408,7 +421,7 @@ class TaskData:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 (takes item names from RDEPENDS/PACKAGES name=
space)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 """
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if item in dataCache.ignored_dependencies:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if re_match_strings(item, dataCache.ignored_=
dependencies):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.have_runtime_target(item):
> --
> 1.5.4.3
>
look good to me. May be you should post it to bitbake-dev@lists.berlios.de
for getting it included into bitbake.

-Khem


