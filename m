Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 106647710B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 19:42:26 +0000 (UTC)
Received: by qgt47 with SMTP id 47so80695407qgt.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 12:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Ki4GeY8L3XyEeBN+Wc5TtxyDlLkgc+2f6jfT7nzDvLM=;
	b=RLXWwVm//DIrXdiLc8//vCP3LIm/TyYzEYmCpbOT6fh/gL2P1xs0WXyDMHcvGQTbp+
	J+dLh0BPKRfnKXPSBrZ9hdSfmvZ/11mGZlMnezhW3vMoyXP4kkq7je0Pnda9JaJvm4MS
	oc+fFNhY724JTqHhjKNTY+IKn8kViZ68WbI67gcZAv8wxpnMZvCt/zePr/B+SqfTuKLp
	bV0OvvWKV4arWc9FQRPCarpx7YBG9zhKPTyEFuC0eeIMFOthado4mQc3ARNizxYEPgNb
	c9dCkV30xzMdVkcrscfnCTnuw4dByaVsAA2CuMayaL8mNZWpj9je+/7eudtQDKSm34B3
	oJXQ==
X-Gm-Message-State: ALoCoQkx81qFUzkjAJ1T3h6M4SR3CfqImjcEzaOB55auGcooE+vZLzNNZxib1e9kOYdeQEMRophz
X-Received: by 10.140.20.20 with SMTP id 20mr14230350qgi.87.1444938146318;
	Thu, 15 Oct 2015 12:42:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 15 Oct 2015 12:42:06 -0700 (PDT)
In-Reply-To: <CALbNGRSUht+HkkJOkv0NZ38yjcOdahPRVOhar830BbcSFYEj9Q@mail.gmail.com>
References: <cover.1444392901.git.jussi.kukkonen@intel.com>
	<CALbNGRSLEKJUYXgMCdv_oB+JD++AemnvNyM8cmCqD7o26wXqeQ@mail.gmail.com>
	<CALbNGRSUht+HkkJOkv0NZ38yjcOdahPRVOhar830BbcSFYEj9Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Oct 2015 20:42:06 +0100
Message-ID: <CAJTo0Lb+ocUQw0O=423w9MO9Tr=J64yTb==GxHzWhQgUu7=AvQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 15 Oct 2015 19:42:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 October 2015 at 18:26, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> I have several gtk3+ applications that stopped working. E.G
> network-manager-applet has stopped working: running
> nm-connection-editor fails with 'Couldn't open libGL.so.1'. Same for
> parole.
> I grepped network-manager-applet: there is not GtkGL or GdkGL found in
> the sources (ok - it could be the dependencies). I still get the
> feeling something goes wrong with libepoxy. And I am quite sure that
> I've seen both (nm-applet/parole) running with gtk3 requiring
> libepoxy...
>

That's not good, sounds like a bug in GTK+3 - it shouldn't be initialising
the GL code.

The only bit of source that includes epoxy is gtkglarea.c.  libepoxy only
looks up libGL.so.1 when it's invoked.

What's the exact message you get, and bonus points if you can attach a gdb
with debug symbols to get a backtrace.  Maybe something like Glade is
instantiating every class?

Ross

