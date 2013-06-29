Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id E776F62240
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 17:47:02 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id um15so3374296pbc.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 10:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=liKOMDrMBOGB4ACDYJxJ1cbSZlsGfiUn11Ow3c55rPU=;
	b=DJGiKVTwXkN4iEWzGvrinyR/g3Nls1iF32nSPio9+PnmrY2hverwceNpb9cXWKG4g4
	1EfJbkQ9JBWLPElcs7GIKqISCK3/P0mqskqKN6n6ubGEqYcO2wt8qBRQMtolCGi32Oqy
	ogOURsmRFt6mtwlKEmB5zL9mMW2p3x++Q33ytLdBp9QBkysI76VNN3b446+p1gWqmqwB
	CkY/ZS+UxDocgYqrhW+Eo6lojtb2Fr0x2XaOP8nRsV0kdDuwOfT2FjARLXK0PhL4dgY5
	ON894RbO5LDwtRe/NKAC/XSG1UL+AyjdDJDR3LnZ1hPfjV5FkjhvnUvj0WmZxOl+FXfa
	9YfQ==
X-Received: by 10.68.197.199 with SMTP id iw7mr16705990pbc.110.1372528024324; 
	Sat, 29 Jun 2013 10:47:04 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	fr1sm13768606pbb.26.2013.06.29.10.47.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 10:47:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130629154635.GX3261@jama>
Date: Sat, 29 Jun 2013 10:47:01 -0700
Message-Id: <24BF6777-D571-4D01-B8B4-8500B9BBDC40@gmail.com>
References: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
	<20130629122713.GT3261@jama>
	<3C785BCF-50C1-4144-8EEC-C2EF2663E2C6@gmail.com>
	<20130629153636.GW3261@jama> <20130629154635.GX3261@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: [meta-browser][PATCH V2 1/3] chromium: Remove older recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Jun 2013 17:47:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 29, 2013, at 8:46 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Sat, Jun 29, 2013 at 05:36:36PM +0200, Martin Jansa wrote:
>> On Sat, Jun 29, 2013 at 07:30:59AM -0700, Khem Raj wrote:
>>>=20
>>> On Jun 29, 2013, at 5:27 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>>=20
>>>> Fails to apply cleanly:
>>>>=20
>>>> patching file =
recipes-browser/chromium/chromium/google-chrome.desktop
>>>> Reversed (or previously applied) patch detected!  Assume -R? [n] ^C
>>>>=20
>>>>=20
>>>=20
>>> don't know what going on there in your tree, but I observed that one =
of the patch is already applied
>>> so I rebased the patch set on top of master and resent a V3. retry =
and let me know if it works
>>> this time. If not I will push it to a contrib tree and you can =
cherry pick
>>=20
>> I've double checked that my tree was identical to origin/master =
before
>> writting this, then I've applied it manually and already pushed it =
before
>> I've replied here, so I wonder if there is another repo which wasn't =
synced?
>>=20
>> Because your rebase should show that everything is already there.
>>=20
>> I've pushed it to:
>> origin  git@github.com:OSSystems/meta-browser.git (push)
>=20
> Few more details:
>=20
> Can you compare downloaded patch from patchwork with your local =
version to see if it got broken by patchwork?
>=20
> I've tried to apply v3 again in older revision and it fails the same.
>=20
> OE @ ~/meta-browser $ git checkout -b =
dc77daa292ef10b38fdcd143d6bfae5008a81a5a =
dc77daa292ef10b38fdcd143d6bfae5008a81a5a
> Switched to a new branch 'dc77daa292ef10b38fdcd143d6bfae5008a81a5a'
>=20
> OE @ ~/meta-browser $ pw-am.sh.oe-core 52693
> 2013-06-29 17:40:39 =
URL:http://patchwork.openembedded.org/patch/52693/mbox/ [68535] -> =
"pw-am-52693.patch" [1]
> Applying: chromium: Remove older recipes
> /OE/meta-browser/.git/rebase-apply/patch:347: trailing whitespace.
> if [ "${USER}" =3D "root" ] ; then=20
> error: patch failed: =
recipes-browser/chromium/chromium/google-chrome.desktop:1
> error: recipes-browser/chromium/chromium/google-chrome.desktop: patch =
does not apply
> Patch failed at 0001 chromium: Remove older recipes
> The copy of the patch that failed is found in:
>   /OE/meta-browser/.git/rebase-apply/patch
> When you have resolved this problem, run "git am --resolved".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am =
--abort".
>=20
> The same when tried from revision =
1f633bb291fd71f0265a1402e6d6e53d95e00bd1
> which is before that nspr commit you mentioned.
>=20


hmmm https://github.com/OSSystems/meta-browser/commits/master
shows these patches are already applied

> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


