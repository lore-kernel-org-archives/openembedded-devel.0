Return-Path: <krussell7711@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6AC77E9A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Feb 2018 01:57:02 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id x4so6669872wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Feb 2018 17:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=0eKzJ+QTAv5e5egdqKLpxTMTKbPg7ZBehrj7t18Tqjw=;
	b=qgHvPuqMbMfM2TVoOgGW3t22krLyeK1DEB3o7OBZLJBa7uRBLqjYMDyuRsgenA4xDp
	7Jg5IeHRyJamn6Ggv5AVTdVp2meDQppdvN1kNc3bSLmz01QuM8J87GmpKWsY83wxQHLG
	EGBQMnwVC7On9m5q1O1JVrtyJf0F/wqd0mCxXx+8oWrp7XaiQqE3Tt6V120zSlVtaOl7
	i8b2nBt/jNLdI51h1WbMYsbtqCm+WsrkKSo92HedT9fO0JZm8SDDm6oz96IRGSftwRDh
	aT27jAexFSkRD46Mf6Yf49wWnTAVMG0mEKW9w4bnO0j/rGLr8C+pbOWGiiSCjCtH0hWa
	beRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=0eKzJ+QTAv5e5egdqKLpxTMTKbPg7ZBehrj7t18Tqjw=;
	b=ZmbRKYVKtcr+eXZ5l3tvOJzn/Yw+dVJMDRQr+s/4josmIWt0H48nKGEMds6f2v2l9w
	VEcklHTy+CGblbhaXYcc8Z7uLVjCI9U1iCm+2BhX/Yn6DZp11AEA5WpAULuTQL24AcsD
	O+V88fDSkWTMBue1jhbK+jpswMc7odHQOYBYhiYMIj9rEsCMhGLC1vFOPinF0uWy7iCt
	oVEoUY+PTbBavY0Fh54CbsL2zIBXcuIpQ/55+DFn/WjzucI/vww6pkXxXtF2no6s/yK9
	vPv3AYehog1HJlok6vse4+ULD08vWW2MfTwPMDNPK4LzeyuYXz5P10TMuskdTOAeUkDJ
	qCeA==
X-Gm-Message-State: APf1xPBFBT/wML04jK6owOFZCNxnObHZ7rFen18PFwahRTrNB0ZhgS/z
	uWHDAEhrxwGUkd45XVX8Vbpeb1t3iJee9BB4QFw=
X-Google-Smtp-Source: AH8x227oQp9oHwUrnZMsTahuHEcPcrv+kXNoZxhRLfraa6wUuToiv2PuGiZpK5GXEgdKZudxuYsDkH+5GSqQBocQAKc=
X-Received: by 10.80.165.37 with SMTP id y34mr14096899edb.179.1518400623514;
	Sun, 11 Feb 2018 17:57:03 -0800 (PST)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.80.173.171 with HTTP; Sun, 11 Feb 2018 17:56:43 -0800 (PST)
In-Reply-To: <CAJdd5GZhQVmfWA7m16nWZL2BwUT6L8LNjJunoiHwXvk56KrALQ@mail.gmail.com>
References: <1518277173-32712-1-git-send-email-bkylerussell@gmail.com>
	<CAJdd5GZhQVmfWA7m16nWZL2BwUT6L8LNjJunoiHwXvk56KrALQ@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Sun, 11 Feb 2018 20:56:43 -0500
X-Google-Sender-Auth: zqHOLLOsxmnOkR5LKdn7UxeIweM
Message-ID: <CAFrQVPNE5yxzds9x8bpWm3ivMDhxxd0S59_JF8FO-q1p8+CMnw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] waf-samba: skip waf_preconfigure() prefunc from waf.bbclass
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
X-List-Received-Date: Mon, 12 Feb 2018 01:57:03 -0000
Content-Type: text/plain; charset="UTF-8"

That seems reasonable to me.  I didn't really like how this change
implicitly depended on the base waf class setup either, but I wasn't sure
if the breakage was on anyone's radar.  I'll try out your other patch
tomorrow.

Thanks!

On Sun, Feb 11, 2018 at 4:30 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Sat, Feb 10, 2018 at 9:39 AM, Kyle Russell <bkylerussell@gmail.com>
> wrote:
> > waf_preconfigure() fails in samba packages because wafbin is packaged
> > differently, and we already pass bindir and libdir through
> > CONFIGUREOPTS.
> >
> > Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> > ---
> >  meta-networking/classes/waf-samba.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-networking/classes/waf-samba.bbclass
> b/meta-networking/classes/waf-samba.bbclass
> > index e490176..94ecf4a 100644
> > --- a/meta-networking/classes/waf-samba.bbclass
> > +++ b/meta-networking/classes/waf-samba.bbclass
> > @@ -42,6 +42,7 @@ CONFIGUREOPTS = " --prefix=${prefix} \
> >  # to help generate the cross answer when adding new board support.
> >  CROSS_METHOD ?= "answer"
> >
> > +do_configure[prefuncs] = ""
>
> Hmm, I'm not sure we want to unconditionally remove all prefuncs.
>
> This breaking samba was brought up to me (since I wrote the patch that
> broke samba), and I actually think a better approach would be to make
> waf-samba no longer inherit from waf.bbclass. The samba method of
> using waf is so different from a "standard" waf usage, that the
> inheritance doesn't really make sense IHMO. I'm preparing a patch to
> do this, and it appears that the only two things that
> waf-samba.bbclass actually needs from waf.bbclass are
> get_waf_parallel_make() and DISABLE_STATIC = "", neither of which it
> can't implement itself.
>
> >  do_configure() {
> >
> >      # Prepare the cross-answers file
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

