Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id B772871E12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:08:07 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id s67so7121467pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=HtR5WOJPaUAvhosUiUr6L3UYK3oIn+SmrXYtugl8CCA=;
	b=IHimBCDSJ4Dk+YHlcLvxuJsCZo7Xdm0S9nBiEZPqwnsqm838kfqyxrYuJd7MdKg4ag
	54PEHVFond3drqUKx1K0DmBXNGKUe7ye4X/vKsceqE5SvKRd2GKrk+AuujKvX3aw6kWi
	SF2y0QjS4V5e2a8PYsDMKDVmlMnUg85IZ46a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=HtR5WOJPaUAvhosUiUr6L3UYK3oIn+SmrXYtugl8CCA=;
	b=ZEqJnhtsP9mifRNCRiyJxHbOF+7MLLyPrcYf+Wk1Hz+BFFaoM3rIPUWbkTIkO2s33T
	Qrky1pKdlnBT3bawjYNvFmhZSbQD4Qh0BUOg69mq4gzpJQIHm8eBXw6uwlbqHLwCx3fB
	OG+qhdC9TA6B+txZMEIVBgpCMDRNKU/C8Q19G+SifAq4JmNHkTxF2eZemEO7XlimVgaZ
	YprBYhbSWomCr0xg+Z/Ya3Ico08C3v3IKNhGzy7iLC6dMKJgmcQ+ItuVBFeXF5UX9h3x
	UEgoGrkdoiG0tkBWZftWzObZ7CfxEJK9TN17NyMOfJG1uTLKntYq6JB2LC+ZwYrTBDwi
	tz/g==
X-Gm-Message-State: AMke39nOBjb1UNXM3A00EMZi59B3NsfA3FaMvVUN2lmP1SchtnsfNy+lgMDlwbFe7P+B4adA
X-Received: by 10.99.45.133 with SMTP id t127mr45082448pgt.224.1487808488538; 
	Wed, 22 Feb 2017 16:08:08 -0800 (PST)
Received: from yct-lpt.lan ([67.23.202.154]) by smtp.gmail.com with ESMTPSA id
	i15sm5618195pfi.94.2017.02.22.16.08.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 16:08:07 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170222213254.GH3283@jama>
	<506a5e6c-36f6-7b1f-a375-24bebb57342f@linuxfoundation.org>
	<CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <9e5c74c0-7b3d-c593-bee1-a4d92c8c49ba@linuxfoundation.org>
Date: Wed, 22 Feb 2017 16:08:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Before you ping some older patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2017 00:08:08 -0000
X-Groupsio-MsgNum: 65488
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="36NXMin8dagdindb7p67JdLOcu6velG4B"

--36NXMin8dagdindb7p67JdLOcu6velG4B
Content-Type: multipart/mixed; boundary="NC7imj8GU7J6oQ5WgFDA9HQN0683g9vej";
 protected-headers="v1"
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <9e5c74c0-7b3d-c593-bee1-a4d92c8c49ba@linuxfoundation.org>
Subject: Re: [oe] Before you ping some older patches
References: <20170222213254.GH3283@jama>
 <506a5e6c-36f6-7b1f-a375-24bebb57342f@linuxfoundation.org>
 <CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>
In-Reply-To: <CA+chaQe23zrLkeJ81iyWxx__=S2PDjGtTSGqm8x5KZOtMd5D_w@mail.gmail.com>

--NC7imj8GU7J6oQ5WgFDA9HQN0683g9vej
Content-Type: multipart/alternative;
 boundary="------------4381B71617CE06847770881D"

--------------4381B71617CE06847770881D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 02/22/2017 03:48 PM, Martin Jansa wrote:
> Hi Michael,
>
> thanks for quick fix.
>
> The hook now shows error about sendmail I wasn't seeing before:

I've reinstalled mailutils and the mail daemon, Can you please try
pushing again.

>
> OE @ ~/meta-openembedded $ git push origin master-next=20
> Counting objects: 78, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (25/25), done.
> Writing objects: 100% (78/78), 7.35 KiB | 0 bytes/s, done.
> Total 78 (delta 56), reused 66 (delta 49)
> remote: No sendmail executable found.  Try setting
> multimailhook.sendmailCommand.
> To git.openembedded.org:meta-openembedded
>    eb7979113..0d27137f0  master-next -> master-next
>
>
> On Thu, Feb 23, 2017 at 12:06 AM, Michael Halstead
> <mhalstead@linuxfoundation.org <mailto:mhalstead@linuxfoundation.org>>
> wrote:
>
>     The hooks are repaired and need testing. (Bad git/config
>     settings.) Please feel free to resubmit patches. Let me know if
>     they do not appear in patchwork.
>
>     I'm trying to see if I can automatically resend the missed patches
>     and mark them superseded if needed. I'll update post here if it
>     works.
>
>
>
>     On 02/22/2017 01:32 PM, Martin Jansa wrote:
>>     1) Make sure they aren't already in master (or master-next), curren=
tly
>>     there is only one change in master-next:
>>     eb7979113 netcat-openbsd: fix implicit dependency on pkg-config
>>
>>     2) Make sure there weren't some negative feedback comments on our c=
hange
>>
>>     3) Make sure the change made it to patchwork, currently there is on=
ly
>>     one "open" change:
>>     https://patchwork.openembedded.org/patch/137499/
>>     <https://patchwork.openembedded.org/patch/137499/>
>>
>>     Be aware that the changes are usually daily marked as archived, whe=
n
>>     they are sorted to corresponding bundles and included in master-nex=
t
>>     branch for testing, as described here:
>>     http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_=
the_same_oe_project_on_patchwork
>>     <http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing=
_the_same_oe_project_on_patchwork>
>>
>>     I'm writing this, because currently many changes are missing on pat=
chwork,
>>     because of some unknown issue with it, see:
>>     http://lists.openembedded.org/pipermail/openembedded-devel/2017-Feb=
ruary/111467.html
>>     <http://lists.openembedded.org/pipermail/openembedded-devel/2017-Fe=
bruary/111467.html>
>>     once this issue is resolved, please re-send missing changes.
>>
>>     Regards,
>>
>     --=20
>     Michael Halstead
>     Linux Foundation / SysAdmin
>
--=20
Michael Halstead
Linux Foundation / SysAdmin

--------------4381B71617CE06847770881D--

--NC7imj8GU7J6oQ5WgFDA9HQN0683g9vej--

--36NXMin8dagdindb7p67JdLOcu6velG4B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYriflAAoJEGpkljW6QlqVUYYQAI5GLhQ2D7LYMNgq68IMqVxM
4ycXzhbe0Oq0UzA5DZb/Hjo835YuCrexX3aecmb01K4tV3PSEXVmZpnrJ+R47vHb
rqtfkQlqpv3CBpcJ1bap9tXq3DJSpdcdjHgoHBFMrKnr+T7EzW6Nu3T0uaj8d2vv
sUyDluGlZxRVUEykgr4ROsQW0AxhQsw6CLXZIcOxW1F9BhG7BKsj2y9g8s22CB3S
UNSsQZBAsMIgodJM3KAfzn9Fo1eZWAAKwAz/fuRLfW0urZUTYfwDbeRSD9wlvA8+
fm4oYqOs+6IOJC5NtC13S2Lmof1bdesQpOnfJBPnCEOH3pDT3Erct8HIa/lwfhqt
AJDtghSl2jRY1WtK82cGVqVOadeGY6WMHAWYpZ8X4QFnzg7jgrgVIV0HpypYSSXb
bCPQl1+wYPYO/RFq1dGrRehDV76m7WgoZFxNPf/r7VuXRgh47ysy2VEInHi4NWX2
mrYyJen2cX8XMnyej5zW6vDMCdHMt/r+TbRo6Fo9Ak34q444ECzXdeglvJZJ2FYi
mtQSSGGHPTmx9/lyZVOwsdlTNkuUW/oSdngMbNZsuJzbuuyIJfSqrk+VGPSagNil
G4tqH6tNZx+sKc2BAASZvogAV6bPoN2tAalk0NFZANdZtQOdIb5GpgKDG4cDjIKu
AsClYIctRyyl7v+6Fr9z
=9K1S
-----END PGP SIGNATURE-----

--36NXMin8dagdindb7p67JdLOcu6velG4B--
