Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id E55D07FC02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 05:31:24 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id v18so21414092iol.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 21:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=dh+VLnW/g+ppqdVzhdZYBKm9ewxz3tlBxDj3AC0YNBU=;
	b=kwPrzjhJ69gI6C4AcI/S/0tDuCZuboci5z/zXkUgO65JyQxTuk5+1AgFBAlqscCSdz
	4a3IA81XX6nqPWDHNpbFTp7Rb4XoPGp59FE+1nWhRXmOiqYueRuNFqBGHcGtrig/EAAl
	AW+fEmmqsG9OrIGL5X4dMNOqUgKYeD1z+D34ziYVAcDLsvFxrvRfFD1mkEKFriT3pomw
	dNCO9vcGQ4chYVMC3lQ/odI1DKYmiFSNiedqE4MQH9RJgijh6d749YbSuUF4njQ8YMo6
	psGaEBr+IfdFcsCXV/4OtGlfbrEiY0rLe+qobRHCChhWt38ZN09nfTOxJywtCQKIw2eo
	mV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=dh+VLnW/g+ppqdVzhdZYBKm9ewxz3tlBxDj3AC0YNBU=;
	b=uXU+eKcdeLpwAVoVq6mAmkzA9JS/ww+lYlzLgo7ioaPUCoxaMRKNvTTmsHQVYfJybS
	WYOxOo4MiiS+Skl9qweMxtA2C7uC04SZPnYO+WppdNNahocrrEtWzUc8SM2JlgFiqNmA
	B6KTVNee2PgmEfWnsmrAW57+hKJMdMmFzFGVJZ9JH7G3gAIRsb7OnFVDU+BW450WL5KC
	cKNSr07FL3/Mzrs9cFIQbtZ0gmx8hA72cCSvYoo2EXplNV7VKWAbQ4n9q/MpHTlKnl22
	1ihrMCsWnMnZzl7b4R6BNpKXtozH3Wftzy1AIy48rkzLQYQSyOrtCozfu9tfjJwphnv3
	cp3Q==
X-Gm-Message-State: APjAAAXZDXISlZcd7yz2od7Q762JMBiRPS5z27cs4XuuK/SEt/kKHyhv
	OHOIT8z8CibiOxIcvYD2iW2gcM7DhEBrMVxzdjz2UWeN
X-Google-Smtp-Source: APXvYqxtTXQMljHUVStCPiid/K7PtAQKN5gjFUxazGJUiB4P8eek43S4W3DIdYlzx6TsHrM1KRDY6Wjqx+Xa87tq1Vs=
X-Received: by 2002:a02:b91a:: with SMTP id v26mr1381529jan.144.1576042285560; 
	Tue, 10 Dec 2019 21:31:25 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 11 Dec 2019 05:31:14 +0000
Message-ID: <CAO5Uq5TEZH_VTN9EpWTDjhqMCgkVEGRB2bi5oXpCXamFMEkv+Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Build looping with "Checking sstate mirror object availability...done"?
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
X-List-Received-Date: Wed, 11 Dec 2019 05:31:25 -0000
Content-Type: text/plain; charset="UTF-8"

Our local master jenkins build looks like it's started looping with:

00:56:28.368  Checking sstate mirror object availability...done.
00:56:28.368  Checking sstate mirror object availability...done.
00:56:28.368  Checking sstate mirror object availability...done.
00:56:28.752  Checking sstate mirror object availability...done.
00:56:28.752  Checking sstate mirror object availability...done.
00:56:29.136  Checking sstate mirror object availability...done.
00:56:29.136  Checking sstate mirror object availability...done.
00:56:29.136  Checking sstate mirror object availability...done.
00:56:29.520  Checking sstate mirror object availability...done.
00:56:29.520  Checking sstate mirror object availability...done.
00:56:29.904  Checking sstate mirror object availability...done.
00:56:29.904  Checking sstate mirror object availability...done.
00:56:29.904  Checking sstate mirror object availability...done.
00:56:30.288  Checking sstate mirror object availability...done.
00:56:30.288  Checking sstate mirror object availability...done.

The only changes from it's previous build are these two:

Layers Update: poky
* poky 9d606cf...f48ef0b (2):
 > build-appliance-image: Update to master head revision
 > sstate: Ensure SSTATE_PKG is reloaded when handling siginfo

Its sstate-cache is on NFS (well AWS EFS) if that's relevant?

At the point I killed it, it was just over an hour in, but was only a
100 tasks into the 7392 - a full rebuild is normally ~3.5 hours, but
this didn't seem to really be making any meaningful progress.

-- 
Alex Kiernan

