Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0596E667
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:34:51 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id u186so20338316ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=LDrOc2SmA1UuQAKijukch2iZMI3m/arbdgeBoSM91pw=;
	b=Jp+Nje0sC+1DZ7ffi67R+zpFOgWqUnkWjsdZ8YB0+G/hWML8og8ACI1lw8rprbVYlS
	Kmztfg89wDnNalm5cwXqDxtra7gLeIkO19fjiMJrCgpfZ8tSNBdIwDj5HXdbJszEvlv3
	lbyyFqNwEp4h8i7RV3kEd3uqUNotT4vK0ZXB+0AAmShGM5vBRmEJAiNzheSrCq8Efdv3
	BtQixHY4C7dsC9G3X/b/fR4QaM9pt1J7nLzmOFUDbgzNdYG6MZYRsZDwampxK4Z7RnMQ
	jGeoipdGNNevoswRIBALfUOBM48kt6Rh85dr2hoTIdqNo0LlE15Gys7f/0g5T7NfOkN+
	KKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=LDrOc2SmA1UuQAKijukch2iZMI3m/arbdgeBoSM91pw=;
	b=LKx37Hd8HRzuuwQkfGjmwkzDzyNdQHL/9d8K+Az0SZGugVEulWAZuWo/vf1Q5NZBwk
	52JCqIaDAzgK964A+YUZ4z6RP17hqXJU7rQTsiNO3A/FXvknmOBLSjD8OaTB49df+R92
	Y2hjvzDZHtYdR4hSFxCKTcqm+/+zSsfolEg+yIM5Y+6eZYsBpLKy8agMyHyZKABFfC9U
	VZaEHqqu6XCatfX3L6G/HCwoGss4GxrnatfztkaioILJXbcAOZ1aL+3uG//bV6qjt4qa
	FemAfVKImKN8OKd9O1DIYqME/XQSm7Aclo2wisiS6g7g84HBHoj+g54S5xYvkhKTrclo
	tMNg==
X-Gm-Message-State: ALyK8tJRdrRUPrhK1goJEUjSk7HhEX1SPtqNa5twwyiNGXHpBCVsKPvSlXReZgKa5wcGkbqsmcT3NNT7eW7wXw==
X-Received: by 10.36.142.129 with SMTP id h123mr22718961ite.66.1468593292456; 
	Fri, 15 Jul 2016 07:34:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.21.197 with HTTP; Fri, 15 Jul 2016 07:34:33 -0700 (PDT)
In-Reply-To: <1468587261-18160-2-git-send-email-git@andred.net>
References: <1468587261-18160-1-git-send-email-git@andred.net>
	<1468587261-18160-2-git-send-email-git@andred.net>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 15 Jul 2016 07:34:33 -0700
X-Google-Sender-Auth: eohD2BxzU_Ntu9qZ75ZBk4Rqa8w
Message-ID: <CABcZANna5ip=FF0NknkneG6pj6w3SvKyrRdP+zmK+vMJgGbnxA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Fri, 15 Jul 2016 14:34:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 5:54 AM, <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>
> c-ares doesn't build if the distro has enabled usage of the
> security_flags.inc file as it is picky about what is placed
> into CPPFLAGS and CFLAGS. It complains and errors out if any
> preprocessor options appear in CFLAGS.
>
> Fix this by providing an additional include file that is
> require'd from conf/layer.conf.
>
> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>

This commit message is a little misleading. The fact that you added a .inc
isn't what fixed the problem, the move of the defines from CFLAGS to
CPPFLAGS was.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

