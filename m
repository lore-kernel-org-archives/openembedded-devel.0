Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D2F39770E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 17:26:28 +0000 (UTC)
Received: by iodv82 with SMTP id v82so97421676iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 10:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=iTTQtvMAz0EIjPGk0MCtYZ/6U5R1taruZKuCbRjNwus=;
	b=Pw/q55vLVlnspa7KTTY6vfcWVE2F8/8VIjxZ5Y3Htov/ZLnbPly0GWY9KOlIu0jjPK
	Ey2OGi5npDYodR7hNdYP762a1Lxrrbigvkm/PPf5/v4+IZFmQ2gOCWE9n64Wwp7VDgaa
	sQCDHNRzVtnyYGIGCYhedw/A3e/JDcJhEuHLeX8MKAc39fBK9Bju9VTFHA44Kr3FoWY+
	oFCrZTZ4AdfO+wwvoSPqfvsvBr7twjmLjn9aDaAR5EV7xsaZPMLNUGAW1FnpWszPH7J6
	YQ3Ufo0jCIzQeR0ZZ9kKYl8IcpvigBqNq0fExAMVusaykzbGjEzB/tEOhxQgUXQsyf+M
	yLAA==
MIME-Version: 1.0
X-Received: by 10.107.30.135 with SMTP id e129mr8315001ioe.99.1444929988116;
	Thu, 15 Oct 2015 10:26:28 -0700 (PDT)
Received: by 10.36.98.143 with HTTP; Thu, 15 Oct 2015 10:26:28 -0700 (PDT)
In-Reply-To: <CALbNGRSLEKJUYXgMCdv_oB+JD++AemnvNyM8cmCqD7o26wXqeQ@mail.gmail.com>
References: <cover.1444392901.git.jussi.kukkonen@intel.com>
	<CALbNGRSLEKJUYXgMCdv_oB+JD++AemnvNyM8cmCqD7o26wXqeQ@mail.gmail.com>
Date: Thu, 15 Oct 2015 19:26:28 +0200
Message-ID: <CALbNGRSUht+HkkJOkv0NZ38yjcOdahPRVOhar830BbcSFYEj9Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/1] Solving the GTK+ libgl runtime dependency issue
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
X-List-Received-Date: Thu, 15 Oct 2015 17:26:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 9, 2015 at 2:20 PM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
> Recap of the situation as I understand it:
> * Gtk+3 works fine without any OpenGL, if GtkGLArea is not used
> * When GtkGLArea is used, Gtk+ uses libepoxy which is supposed
>   dlopen the correct libraries as they are needed
I have several gtk3+ applications that stopped working. E.G
network-manager-applet has stopped working: running
nm-connection-editor fails with 'Couldn't open libGL.so.1'. Same for
parole.
I grepped network-manager-applet: there is not GtkGL or GdkGL found in
the sources (ok - it could be the dependencies). I still get the
feeling something goes wrong with libepoxy. And I am quite sure that
I've seen both (nm-applet/parole) running with gtk3 requiring
libepoxy...

Andreas

