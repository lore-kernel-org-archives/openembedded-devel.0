Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 027CB7FBEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 22:48:41 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id w12so4150231iol.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 15:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lf40y/G6xqEAmetj3iyJR6UQjuJkG0P0r3KZXHvHeBI=;
	b=o2WKE3d9VL89o74FJYWfkBZrVtUQheUd+XSETew7dQXfnRblmZMPuygV53bsAj+Afj
	B7sCDR01TRXaHL0pynP5Vz2KA0uZd9/JKLyBI0SFpKQRv+Nibdp0qyX7fCdvDlDv35C7
	lFYWzZQfiaX6uG7uDBXQoQQNkZ00RA28u8vyFIowlk+X5wEgEeri4R+PIHFsH5ZbhZvx
	WD5n0wVVJOT3FZ5puT5Jlbk9fNBzVCfhHqDfC9rj8JmjsrqL7vecvWFQvBI1RtQDHUVh
	Wjzqo8RilgN0anHzkhjNClXaffF4bCCCXy8iEl9ko0YA4gI/SGnW9x7ao4IvGA3TPJ8I
	UNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lf40y/G6xqEAmetj3iyJR6UQjuJkG0P0r3KZXHvHeBI=;
	b=daNb4AH5GITBa2h/dJnHTyvR5ebN/1mh24Lc/9f1wvroh1o2VrejQrTBzIfpVMM1f7
	s26Vdz+LSXBsX7USQ+17N1vug2NYjNcWwl+uXufAj2dwYCAbbsa9bzuQjLRO7TIRlD98
	DRxMevY/HFyC07EkMUbtODhXlG4S83x6xoZ2T8zh7TnTXyoMxJsOi3TssY6MAytizx0O
	zLx+dvkdHDHiPXlv34m9etaogcWq3RcKnuQy5ByNdJ+rfQxQfyr/XAgmQZvNxCmOhz79
	BkbpVdI9IREZ0/RBDJcsBm7qs1RE7qWu/V+Kb3ValWfcD4G6J9i9cIBwQ7b5NUpnF08E
	9QQw==
X-Gm-Message-State: APjAAAV02Z1kM8JxsANRr8l2KtiI30HthsxOXja6KPNQC5lKR1a19GFe
	G+Rte43H1B2fW3yvk/8d0guylQlVyGoEuXI0XiM=
X-Google-Smtp-Source: APXvYqx5rTrJodDPvsJae6p0NkwXrTOzrs3sja0lWc96RwxpU4620RKz11ks0db+veyZJwLfRr3swfeGE9+9DgPYh5c=
X-Received: by 2002:a6b:7414:: with SMTP id s20mr5878167iog.299.1572043723036; 
	Fri, 25 Oct 2019 15:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
	<20191025072113.11172-15-schnitzeltony@gmail.com>
	<CAMKF1so2PpCg4ot6g1wjAs9sneFRypXU0qaGbxR-hQ3zo1wjqg@mail.gmail.com>
In-Reply-To: <CAMKF1so2PpCg4ot6g1wjAs9sneFRypXU0qaGbxR-hQ3zo1wjqg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 26 Oct 2019 00:48:31 +0200
Message-ID: <CALbNGRRMfw8B8M6OLoU07tSuu4cy_QLXLjApTL4acMKLyMBeBg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 14/15] colord: initial add 1.4.4
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
X-List-Received-Date: Fri, 25 Oct 2019 22:48:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 25, 2019 at 11:37 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Native build fails
>
> https://errors.yoctoproject.org/Errors/Details/274649/
>
Smells like gold...

Andreas

