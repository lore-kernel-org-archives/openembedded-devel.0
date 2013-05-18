Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UdlKJ-0002Tr-9Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 May 2013 19:53:52 +0200
Received: by mail-vc0-f182.google.com with SMTP id gf12so402506vcb.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 May 2013 10:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=bhz/QKdePJWm7P/QK/p8bK0BeYMFesSeNHh5HuzFKwY=;
	b=sZO/0gm8Cd3ywKVoCorTOsHNK5Z6dmBI0/wz39zqUWcgcPE3xT+76VVXc49/WYKTL+
	CFTq1FBQhdsQqrTSXCQJzTHp6KjdwM6yY3x/eYzc+ngbNNQyVFk03yZRtmaD+heZ06/Y
	kvMHAodcGC8wQvkv3anZiXN0SjOBdDX0pzSCDhEGTQA6uluhV9xDQS7DA64EBvr/mSom
	iuoCZuQ6KA55raGACSFVRfiZA9i/5C2azFD8m6SYwWmLeD8amVskPJWshvhYm7eSJ3Vh
	rCHVX+NbNhDz9JkYTxf6TvF53vENNuqDpkCeVg3YuEQ35srJooB8wG7enAx2/2+J7SOE
	J4Fg==
MIME-Version: 1.0
X-Received: by 10.58.202.103 with SMTP id kh7mr16879358vec.19.1368898533515;
	Sat, 18 May 2013 10:35:33 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Sat, 18 May 2013 10:35:33 -0700 (PDT)
In-Reply-To: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
References: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
Date: Sat, 18 May 2013 19:35:33 +0200
Message-ID: <CALbNGRTG44omNit6qx-7EmTLXJGN_HJytYGtsqL_z2pHepOnrA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] libxi: Match the bbappend to OE-Core
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
X-List-Received-Date: Sat, 18 May 2013 17:54:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2013 at 6:39 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC: Eric B=C3=A9nard <eric@eukrea.com>
> CC: Denis Carikli <denis@eukrea.com>
> CC: Otavio Salvador <otavio@ossystems.com.br>
>
> ---
>  recipes-graphics/libxi/libxi_1.7.1.bbappend |    2 ++
>  recipes-graphics/libxi/libxi_1.7.bbappend   |    2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-graphics/libxi/libxi_1.7.1.bbappend
>  delete mode 100644 recipes-graphics/libxi/libxi_1.7.bbappend
>
> diff --git a/recipes-graphics/libxi/libxi_1.7.1.bbappend b/recipes-graphi=
cs/libxi/libxi_1.7.1.bbappend
> new file mode 100644
> index 0000000..c90046b
> --- /dev/null
> +++ b/recipes-graphics/libxi/libxi_1.7.1.bbappend
> @@ -0,0 +1,2 @@
> +PRINC :=3D "${@int(PRINC) + 1}"
> +BBCLASSEXTEND +=3D "native"
> diff --git a/recipes-graphics/libxi/libxi_1.7.bbappend b/recipes-graphics=
/libxi/libxi_1.7.bbappend
> deleted file mode 100644
> index c90046b..0000000
> --- a/recipes-graphics/libxi/libxi_1.7.bbappend
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -PRINC :=3D "${@int(PRINC) + 1}"
> -BBCLASSEXTEND +=3D "native"
> --
> 1.7.9.5
>
Martin sent same already - for unknown reasons it did not make it into
patchwork [1]

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-May/045597=
.html


