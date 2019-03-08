Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id A23AB7CDB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 07:57:11 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f6so1762703iop.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 23:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=VLKYJUvck9pVNIFtI3Nxa5sNrIijaDtpIAvxLseHhfg=;
	b=Kv7IIAUoI+U7T+GEu1EERFt+IIuG2K4L/eiw8k/IN7U9wnwio7hK7wTGjdgO/aVHq7
	CuXVXudbDG2ihZ2IRbd2llGuZE1wEPGIvNCU3CRnUPWU5ivLDFzalB5Bj1YmbeD7u5W3
	t9ij8KZDXsLH2VVsAd/tiekHuJalP0UnUssJLYLWu1opidIW5WQXNm6oXyBvyOp4Se0A
	vGB+q/wCGqSbWp58VneEPcryUqEwgMRHsv+YdX6BgS+thr/HEF18ogVfvwoPyWlt0o1y
	JNShQx7z0X1Dx2ms3tHheJo8u3oL4xewMvgvfsI9gR7HB9VsdB1e7jz61O/e6JV+7V0O
	eGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=VLKYJUvck9pVNIFtI3Nxa5sNrIijaDtpIAvxLseHhfg=;
	b=a97XOktw4p/AmSbDH3/4TqSX+a7btbB+cHXAHLmXBIN0OWIbPI7Ri3h0JS+5b2WlTp
	jLYNvv4MUvYnrR+XLwGfdDzubKppPqDtlTAidyrAK0+XHZ5ntyk0jdROEA0NLA0GGs8G
	djd8sKN39XqSGNrsLZJs/vBfMgXcp7t2KW7dChdAbDNKvp1c9TcFCSHQ0vD5T6z+Ng11
	MfyNwy3Z6VHBy5Z2NWuy3sDeX6FVxCF5EVnrFu4qVJXhGWKHYEihouExKG20/M15l8nr
	1nfZlVzYGCU/btXqJGeXa73PQ6x63x5WXgd3TqS8yo7bueD1z8zF5qerXM2uNbEzSgjh
	5Rog==
X-Gm-Message-State: APjAAAU6SOg62COYwQGT4Im0EF1OMLs98JpkHg15du07SuBUs9cDWgiz
	Oe+p0kxWMZXo/Winltpu9QfWJslwQFWlOHmou6k=
X-Google-Smtp-Source: APXvYqwPuxhamg730gdOkkQUHYEiTkf1mrMsYODklllIqjMu5y7ODfIwH0lADOwu89aM3r6TUoOHu9VKZrJeFuvW/1s=
X-Received: by 2002:a5d:9a08:: with SMTP id s8mr7706721iol.99.1552031832693;
	Thu, 07 Mar 2019 23:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20190308013237.194105-1-kai.kang@windriver.com>
	<20190308013237.194105-4-kai.kang@windriver.com>
In-Reply-To: <20190308013237.194105-4-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 8 Mar 2019 08:57:00 +0100
Message-ID: <CALbNGRSzvkdwr24cvwrp1MW29JeduDKqza2epCaqJGQqXXUD-g@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 3/5] gvfs: 1.39.1 -> 1.39.92
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
X-List-Received-Date: Fri, 08 Mar 2019 07:57:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 8, 2019 at 2:33 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
I have overlooked your last update: Please don't update to unstable
gnome releases (odd version numbers) in the future. As far as I can
remember there were similar comments in oe-core already.

Andreas

