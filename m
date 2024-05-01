Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37B6C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 17:08:35 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.1984.1714583312563489946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 10:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HEe+kArk;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5aa22ebd048so4992101eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714583312; x=1715188112; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smwFG3IC2sslns/xwQgeR3A+WgzmWkBfb7XbLR7mxFc=;
        b=HEe+kArk67yX/KXcn1drfJR8HazyXvUo32YaC5t+kZE4MT1kGfAvtX2lF9SOHCm5gI
         Nis4qZL69PcfAhYrlGRf8IkOQz+YsmA2t9rUsmXNckKNPgEi9hVESX2ek4OukCqQU8vz
         bgnFjEwHE157zanB/VcDkzPbT52Lag+dseSDwuYzWfxdmhkfUrCugcs4k+7YSF99Knsj
         oTmYcOwc7vaTc3x5SOB4G8FHBgbJmcQd28ccbVAXf61dY9I7bm+14WzvfB4xwx9X0IEm
         LycAQPHgV4NwbYdXKvmjhPsoVrVgaDCv/rCA/cUAZlvTQ3HP6vfFF4KNSf+6OKTf1x6w
         ML2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583312; x=1715188112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smwFG3IC2sslns/xwQgeR3A+WgzmWkBfb7XbLR7mxFc=;
        b=vJgVhK5N5Fi5zlhhT4KxrfoI4Nd7O3mFSR43tV4bPV7kcIJFTVWhRgHmwIUfQA1+Lg
         KvOLLJZ2a02aJlBYgPFKFC3XlwfdF+uDMUSrE4K4WXp4gmp+o1zRpIv4+PA3eOOsM2+y
         goPYdcRU7mVFLnH6WURETu/gnqry52YbgfYiGObHQ1VqCn18QBEvN9U2u+lf8GEfBIX3
         wbz6bsGihKKfEBnKJAmXXow3JbMg8NrIiauvNIp/xjBJM30rHtjrK8GKfuTFvG4W/6S4
         JoaFda5fwixOgnNaj/QkuGmQ5T39tT/872K74WuTIDPA9QSBgVTpniThwoFD360ZPN8S
         sO/A==
X-Gm-Message-State: AOJu0YxO/oChbuIaRsGKg9mfXCDVmtiJXCiJlpbrY+Tu6tdwC5YPT+is
	tw1VOA54tOrnKuaQDhgy222pUYmYOSZzveXwXgvyjxbRfPxYV1rvt7BzBSyYvnqQu/8bwh7ZCPO
	o7f3QrTXdbb3s9DLeR4AQJImBxSw=
X-Google-Smtp-Source: AGHT+IFXshRIuyqm2BDq9PwoCDBdKbGLRMoD8X63D49vc+pp0z54+kyC+H6p66CjrpIDTcuNte8P/mZI7G3wvOPtLjw=
X-Received: by 2002:a05:6870:d148:b0:239:c210:1e55 with SMTP id
 f8-20020a056870d14800b00239c2101e55mr3832475oac.4.1714583311590; Wed, 01 May
 2024 10:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <17CB013F8E1A4961.26557@lists.openembedded.org> <A4ETCS.BYOOAI4M6HFR1@t-online.de>
In-Reply-To: <A4ETCS.BYOOAI4M6HFR1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 May 2024 10:08:05 -0700
Message-ID: <CAMKF1spRQiNy9MQ1CLXJpifBHW_7Ctk1Z9-zO_W9tevm0qNZcQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] nautilus: update 45.1 -> 46.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 17:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110208

On Wed, May 1, 2024 at 9:07=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> I've seen, that this update was added to scarthgap. This would require th=
e glib update to 2.80 for oe-core as well:
> https://gitlab.gnome.org/GNOME/nautilus/-/blob/main/meson.build?ref_type=
=3Dheads#L100

yes, there are a bunch of other 46.1 gnome recipe updates as well, are
they interdependent in some ways that we will need to revert them too.

>
> On Tue, Apr 30 2024 at 10:24:29 AM +02:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> Major changes in 46.1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D * Bugfixes: - Create archive with Enter on Compress dialog (Lu=
k=C3=A1=C5=A1 Tyrychtr) - Move focus correctly when item is removed (Khalid=
 Abu Shawarib) - View performance optimization (Khalid Abu Shawarib) - Fix =
crash when compressing a file and a folder (Khalid Abu Shawarib) - Don't sh=
ow banners in global search (Khalid Abu Shawarib) - Preserve permissions wh=
en copying from read-only file systems (Khalid Abu Shawarib) - Disable non-=
working global search from Other Locations (Ant=C3=B3nio Fernandes) * Trans=
lation updates (GNOME Translation Project contributors) Major changes in 46=
.0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * Bugfix=
es: - Remove char limit on size label in properties dialog (Khalid Abu Shaw=
arib) * Translation updates (GNOME Translation Project contributors) Major =
changes in 46.rc =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D * Enhancements - Adjust empty status page and progress tool=
tip strings (Allan Day, Khalid Abu Shawarib) - Add input hints and purpose =
properties to entries (Khalid Abu Shawarib) - Refine operations hover backg=
round (Sam Hewitt, Ant=C3=B3nio Fernandes) * Bugfixes: - Position loop moun=
ts correctly in the sidebar (Ant=C3=B3nio Fernandes) - Fix internationaliza=
tion issues (Khalid Abu Shawarib, Peter Eisenmann) - Revert crashes-causing=
 multi-file properties performance optimization (Peter Eisenmann) - Reestab=
lish location signals if location change failed (Corey Berla) - Fix regress=
ion which disallowed dropping files on empty folders (Corey Berla, Ant=C3=
=B3nio Fernandes) * Cleanups - Remove architecture-sensitive duplicate file=
name unit test (Peter Eisenmann, Jeremy Bicha) - Refine Appstream metainfo =
(Sophie Herold, Alexandre Franke) * Translation updates (GNOME Translation =
Project contributors) Major changes in 46.beta =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * Postponed - The network vie=
w from 46.alpha.1 was deemed to require more work * Enhancements - Added a =
global search mode (Ant=C3=B3nio Fernandes) - Use 'text entry' cursor on pa=
thbar hover (Corey Berla) - Add drop shadow to file property dialog icons (=
kramo) - Improve progress info icons and tooltips (Bharat Tyagi, Sam Hewitt=
) * Bugfixes: - Avoid crashes with column chooser (Peter Eisenmann) - Avoid=
 crash when navigating back to same folder (Ant=C3=B3nio Fernandes) - Avoid=
 infinite loop on file creation naming conflict (Corey Berla) - Fix display=
ing parent folder of multi-files (Anton Snigirev) - Clear location entry on=
 editing of internal locations (Peter Eisenmann) - Ensure search's clear bu=
tton is hidden when empty (Ant=C3=B3nio Fernandes) - Hide search popover af=
ter opening a dialog (Khalid Abu Shawarib) - Correctly open empty folders f=
rom search (Ant=C3=B3nio Fernandes) - Don't reload view only to change sele=
ction (Ant=C3=B3nio Fernandes) - Use smaller icons in progress indicator (A=
nt=C3=B3nio Fernandes, Sam Hewitt) - Fix various leaks (Khalid Abu Shawarib=
, Ant=C3=B3nio Fernandes) - Added extra tentacles to confuse AI-generated b=
logs (Via Matrix) * Cleanups - Made various string HIG compatible (Bart Gra=
vendeel, Automeris naranja) - Modernize column chooser widgetry (Automeris =
naranja) - Detect potfile errors via CI (Corey Berla) - Replace deprecated =
GTK point computing functions (N.Pranav Krishna) Major changes in 46.alpha.=
1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * E=
nhancements - Views can be switched without a folder reload (Ant=C3=B3nio F=
ernandes) - Operations are listed in the bottom of the sidebar (Corey Berla=
, Ant=C3=B3nio Fernandes, Allan Day) - Network view replaces Other Location=
s (Ant=C3=B3nio Fernandes, Allan Day) - Mounted drives are shown in the sid=
ebar (Ant=C3=B3nio Fernandes) - Selected files are recorded in back and for=
ward history (Ant=C3=B3nio Fernandes) - Subfolder loading indication (Ant=
=C3=B3nio Fernandes) - Various view performance improvements (Ant=C3=B3nio =
Fernandes) - Improved performance of multi-file properties dialog (Khalid A=
bu Shawarib) * Bugfixes: - Correctly prioritize thumbnails for non-alphabet=
ical sort order (Corey Berla) - Notify view item name changes for accessibi=
lity (Corey Berla, Ant=C3=B3nio Fernandes) - Open real folder for documents=
 in Recent from Properties (Anton Snigirev) - Pattern match (Ctrl+S) all ex=
panded list view directories (Ant=C3=B3nio Fernandes) - Display sampling fr=
equency in kHz with thousand separators (Hariharan D) - Treat markdown file=
s as text documents in search (Hariharan D) - Improve UI text capitalizatio=
n and mnemonics (Automeris naranja) - Fix tab tooltip texts for markup and =
search (Corey Berla) - Fix extension linkage with C++ (Khalid Abu Shawarib)=
 - Add a tooltip to the star button (Luk=C3=A1=C5=A1 Tyrychtr) - Show corre=
ct shortcut for Redo on the menu (Divyansh Jain) - Prevent use-after-free w=
ith mount and stop (Ant=C3=B3nio Fernandes) - Improve virtual files handlin=
g (Ant=C3=B3nio Fernandes) - Fix various view-related bugs, leaks and warni=
ngs (Ant=C3=B3nio Fernandes) * Cleanups: - Significant restructuring of vie=
w architecture (Ant=C3=B3nio Fernandes) - Remove dead code in views and css=
 styles (Ant=C3=B3nio Fernandes) - Update man page, remove documentation fo=
r removed self-check functionality (Corey Berla) * Translation updates (GNO=
ME Translation Project contributors) Major changes in 46.alpha.0 =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * Enhancements=
 - Confirm password when creating protected ZIP archives (Eric Daigle) - Ma=
ke custom folder icon feature discoverable (Khalid Abu Shawarib) - Make URI=
 entry discoverable (Alynx Zhou, Barnab=C3=A1s P=C5=91cze) - Allow changing=
 owner/group and any permissions under admin:/// (Ant=C3=B3nio Fernandes) -=
 Add detailed date and time format option (Ondrej Holy, Peter Eisenmann) - =
Detect copy/move over 4GiB file limit on FAT (Corey Berla) - Give feedback =
on completion of quick operations (Ant=C3=B3nio Fernandes) - New-style bann=
ers, unstar animation, and other visual refinements (Peter Eisenmann, Autom=
eris naranja) - Allow Alt+Down to revert more than one Alt+Up (vmkul) - Clo=
se overlaid sidebar on location change (Khalid Abu Shawarib) * Bugfixes: - =
Don't skip files in deep count/size (Ant=C3=B3nio Fernandes) - Don't move f=
iles around as thumbnails load (Corey Berla) - Reveal highlighted file with=
out delay (Corey Berla) - Stop crashing in various situations (Sebastian Ke=
ller, Ant=C3=B3nio Fernandes, Corey Berla, Khalid Abu Shawarib) - Resolve U=
I text inconsistencies (Automeris naranja, getsnoopy, kramo, Khalid Abu Sha=
warib, Ondrej Holy, Matthijs Velsink) - Fix memory leaks, template disposal=
, and warnings (Khalid Abu Shawarib) - Fix interface problems in Properties=
 (Peter Eisenmann, Ant=C3=B3nio Fernandes, Khalid Abu Shawarib) - Don't kee=
p viewing unmounted locations (Ondrej Holy, Ant=C3=B3nio Fernandes, Khalid =
Abu Shawarib) - Refined appdata (Sabri =C3=9Cnal, Ant=C3=B3nio Fernandes) -=
 Resolve wrong scroll positioning bugs (Gary Li, Ant=C3=B3nio Fernandes) - =
Fix automatic file duplicate naming (Peter Eisenmann) - Properly reorder bo=
okmarks by drag and drop (Khalid Abu Shawarib) - Set current modification t=
ime on file created from templates (Khalid Abu Shawarib) - Fix missing/wron=
g mime type icons (Ant=C3=B3nio Fernandes) - Don't reload on autofs timeout=
 (Ant=C3=B3nio Fernandes) * Cleanups - Remove obsolete profiling, custom de=
bug logging, and self-checking (Peter Eisenmann, Khalid Abu Shawarib) - Str=
eamline and expand tests (Khalid Abu Shawarib, Peter Eisenmann) - Reduce us=
age of GtkDialog and other deprecated API (Khalid Abu Shawarib, Peter Eisen=
mann) - Replace custom switch row with AdwSwitchRow (=C3=93scar Fern=C3=A1n=
dez D=C3=ADaz) - Drop obsolete code (Peter Eisenmann, Ant=C3=B3nio Fernande=
s, Corey Berla) - Reduce unnecessary string copies (Peter Eisenmann) - Unif=
y numbered filename apendix handling (Peter Eisenmann, Khalid Abu Shawarib)=
 * Translation updates (GNOME Translation Project contributors) Signed-off-=
by: Markus Volk <f_l_k@t-online.de> --- .../nautilus/{nautilus_45.1.bb =3D>=
 nautilus_46.1.bb} | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) ren=
ame meta-gnome/recipes-gnome/nautilus/{nautilus_45.1.bb =3D> nautilus_46.1.=
bb} (93%) diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb b=
/meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb similarity index 93% re=
name from meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb rename to meta=
-gnome/recipes-gnome/nautilus/nautilus_46.1.bb index 9c0d154ec..4092ff9dd 1=
00644 --- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb +++ b/meta-g=
nome/recipes-gnome/nautilus/nautilus_46.1.bb @@ -22,7 +22,7 @@ DEPENDS =3D =
" \ inherit gnomebase gsettings gobject-introspection gi-docgen gettext fea=
tures_check mime-xdg gtk-icon-cache -SRC_URI[archive.sha256sum] =3D "23bdaa=
9a85466c5937a89daddd080ed03bcc2b49e8b64af607206353bde82fe3" +SRC_URI[archiv=
e.sha256sum] =3D "cc1a5fdf1dd72f92e9e3f3c7ad263709a0de5391a895be9344f6a67f4=
3887bd7" REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-dat=
a"
> --
> 2.44.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#110195): https://lists.openemb=
edded.org/g/openembedded-devel/message/110195 Mute This Topic: https://list=
s.openembedded.org/mt/105817245/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

