Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDjeb-0008MJ-Ft
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 21:09:55 +0100
Received: by ywo7 with SMTP id 7so268740ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 13:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=YGomZzJmQKNvCJVF7ZR5H9A5nvx72nxkAC9BQYiD120=;
	b=JzeDO6A2rAqzbcO/GScfLrbaVWMKd2hbMKheTtAt47qo8g23iatuW6nMtGnidKCHKA
	br4xme1IKbytyM3VPokl04QWP+ClonhyBo0OKA6h5G7d+qHQc074szGNgpqNP0EaMGrq
	N03+6Uy1oa1DxE8itZ8oL6JJYi4lvnYHAl8m4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=OOaVCCuLbV3jKqeA+T93FcxMiJD7gPE9ScBB8/OkG1adEuF8R8lvYSpa/hYxn5AlvO
	zpmOAjCcSOs8SmMEZVwOgh4eY03Wrln1j1AI+MjdFIKl2MS17Hl5e4827tWJP/ORgnWE
	zviVrJQGqcbHr23X+njKz8BP3PuSdvKMirc+w=
Received: by 10.91.11.6 with SMTP id o6mr1473061agi.91.1288814941475; Wed, 03
	Nov 2010 13:09:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 13:08:40 -0700 (PDT)
In-Reply-To: <4CD1A210.5000007@telus.net>
References: <1288776534.3980.33.camel@mattotaupa> <4CD1A210.5000007@telus.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 13:08:40 -0700
Message-ID: <AANLkTikPj2HeqhVfMpnk+6ToBh2o2p6MYod=K9y1w-4s@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: [PATCH] vlc_1.1.4.1: add `lua5.1` to `DEPENDS`
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
X-List-Received-Date: Wed, 03 Nov 2010 20:09:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2010 at 10:55 AM, Dallas Foley <dfoley@telus.net> wrote:
> On 10-11-03 02:28 AM, Paul Menzel wrote:
>>
>> Date: Wed, 3 Nov 2010 09:52:36 +0100
>>
>> After VLC 1.0.6, being the latest version in OE until addition of 1.1.4.=
1
>> in commit 30e362 [2], some interfaces were implemented in Lua in VLC 1.1=
.0
>> [1].
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Interfaces:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Renamed the legacy rc, telnet and http int=
erfaces to oldrc,
>> oldtelnet and oldhttp.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * rc, telnet and http are now implemented us=
ing the lua interface
>> system.
>>
>> Task `configure` fails with the following error message.
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking for LUA... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| configure: WARNING: lua5.1 not found, tryin=
g lua>=3D 5.1 instead
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking for LUA... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking lua.h usability... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking lua.h presence... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking for lua.h... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking lauxlib.h usability... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking lauxlib.h presence... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking for lauxlib.h... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking lualib.h usability... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking lualib.h presence... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking for lualib.h... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking for luaL_newstate in -llua5.1 ... =
no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking for luaL_newstate in -llua51 ... n=
o
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| checking for luaL_newstate in -llua ... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| configure: error: Could not find lua. Lua i=
s needed for some
>> interfaces (rc, telnet, http) as well as many other custom scripts. Use
>> --disable-lua to ignore this error.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0| ERROR: Function do_configure failed
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: package vlc-1.1.4.1-r0: task do_configu=
re: Failed
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
>>
>> Adding `lua5.1` to `DEPENDS` is chosen in favor of disabling it.
>>
>> [1]
>> http://git.videolan.org/?p=3Dvlc.git;a=3Dcommitdiff;h=3D3c1df96cda8086f6=
05f2eacaa5653c9e43ec45ac
>> [2]
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D30e362c2=
2a49521ebeef9bed1f0c58902b7dc50b
>>
>> Signed-off-by: Paul Menzel<paulepanter@users.sourceforge.net>
>> ---
>> =C2=A0recipes/vlc/vlc_1.1.4.1.bb | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
>> index d4535a5..ef764c1 100644
>> --- a/recipes/vlc/vlc_1.1.4.1.bb
>> +++ b/recipes/vlc/vlc_1.1.4.1.bb
>> @@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D
>> "61c9ea30a17ea40c6ccbfd507026e5c83ad9e0691f221d3667c8e49696
>>
>> =C2=A0# ffmpeg from git (library version =3D> =C2=A052) is required
>> =C2=A0# libtool-native must be>=3D 2.2.4
>> -DEPENDS +=3D "libdvdcss libdvdread"
>> +DEPENDS +=3D "libdvdcss libdvdread lua"
>>
>> =C2=A0EXTRA_OECONF +=3D "\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-dvdread \
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> I seem to need lua5.1 and lua5.1-native in DEPENDS for this vlc as oppose=
d
> to just lua.
> ie. DEPENDS +=3D "libdvdcss libdvdread lua5.1 lua5.1-native"
>
> I doubt this has anything to do with it, but I am using
> DISTRO=3D"angstrom-2010.x"
> and setting
> ANGSTROM_LIBTOOL_VERSION =3D "2.2.6b"
> LIBTOOL_HAS_SYSROOT =3D "no"
> only because apache2 does not configure with the newer libtool
>

did you report the apache problem and details about it before ?
if not the please do. I would say we should find the reasoning when we
add something to DEPENDS
the addition is simple but impact may be too far reaching.

>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


