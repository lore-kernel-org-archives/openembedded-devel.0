Return-Path: <williamdelacre@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id CA4C578AA7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 21:31:24 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id m13-v6so5952138uaq.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2018 14:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ourlYqRII1Rat/8Ljgl73Zj/se9q16vYm5hjKW6HCUk=;
	b=Lfuni/E/k0umfgw2scDbsAf0jsSJtkMEaF+WmD4WEyti14UNqqv2ciKK1tNRQ6QFg5
	20E2NE0UUax1h+HYn//EGIT2elH8wQxqhZM2r7xQ7WczBk1/VfX2lIWwE6h45mlIndod
	NS2cH1P20ggSOyA/5j+hjEFjxr/6P4OGFqW6NSHIOpLSFWvg2J4DNPs4JxFapJMvcDU+
	fK96KwluooRQbxdhJzONq46VTteSAFB+mfgrZTGp3AEf2HSkmFEnjkT0QoK6Q+Gk38Qf
	13QIcLrSuKMGtWIUi7W2mtZ+g9J8jvJwf1bmkKxTigpnaFySsla+JBOhhT6MEZz42ie2
	ytOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ourlYqRII1Rat/8Ljgl73Zj/se9q16vYm5hjKW6HCUk=;
	b=HqXyPkuQUK2Nr8TfrJK/QPW1qOFbqPzO5iNjw21sG6Jv4mQ0XQ50cQ/nqdRw7UKs3S
	S+rqI6LpmRCtfNhxespEq2XYbN5o7ch10wYjOXv/R5RzJGh5lU7Dh8xh1uKxYFEgiUzV
	OTMzsWEV9C/U0tGSISUCyVpQCLGyOYcH0M23Hi0JTiBZuKYlkmYIdPTY4KAmTT11a5S4
	+lWrWYXA0wzvOEvVKLpj7ZxLRokY8hvBh4Lrbcy0idex2AKPDy5qUgCbol58TfDuxOOz
	crQaIjAkx8jX5YdYGAWz0qEdnkDd+QQ5kZcmTOYp69wY4wjMwSEi8ls2D9REPj4oWyhu
	HCtQ==
X-Gm-Message-State: AOUpUlGJeMTapY/V5uLPWrE1QbeB6yJv5LmVvWZeNjAm/TbjYZ7vwr6C
	BLKP9YzElqMsuOl2xJ8jKvcKidmusgc1y6UkPXMtPA==
X-Google-Smtp-Source: AAOMgpeOzyb+sqkmZUQR6AjKyoeWBVVVA6frWr/1x9XzaigFkud6tDK7Gd6ObMpRHTRZtC+Qh+xZMOUYPMqMcA/cl6k=
X-Received: by 2002:ab0:66d4:: with SMTP id
	d20-v6mr3999753uaq.112.1533331885717; 
	Fri, 03 Aug 2018 14:31:25 -0700 (PDT)
MIME-Version: 1.0
From: William Delacre <williamdelacre@gmail.com>
Date: Fri, 3 Aug 2018 23:31:14 +0200
Message-ID: <CAOnRZEJX6vtCikSJK4py2y3r3J-N3fT_tA5FLFYFyPF6vrczjw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Actually installed packages
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
X-List-Received-Date: Fri, 03 Aug 2018 21:31:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

What=E2=80=99s the difference between the build/buildhistory/packages conte=
nt (all
the packages found here) and the installed-packages.txt file in
/buildhistory/images/...... ?

I can see packages in first one which are not included in
installed-packages.txt

Could anyone explain this to me ?
Thanks :-)

