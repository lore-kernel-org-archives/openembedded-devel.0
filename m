Return-Path: <leon@sidebranch.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 89C0571B48
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 19:45:10 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id 104so22304555otd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 11:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=QkBmgUjxM4x1Irm7RTfthwpq8OULiuJePAUqODxzeko=;
	b=NBotkElQN9939WMW0S91CCVK7fMKX1LsFvNk/81+9TvKJN4tQbjyEs3m6ihfOe0OB9
	s4/VtDlhpgJ4BvwMgmV5KpxFBoMi8dDEQ82RSwl7YlzrsikrP5WUsOsM1RE5V8t5ytDZ
	4LINgESKDRqC7FY5wvzKIpvpsTmMeXZKrrXtCtUx5fbT8smP8EES0A4Oo9Of20+7qbDo
	eHmUNOnDIfGQpG67X9gkbHVoAMm1gGI0imoMvkko0v8gt6+1KPHUdlp4gLdoOhE6ZZqf
	JcrO/vK/WWVWyTSrJIcrsbdZRVv0O3Rh+ZV8BxpBgCvnQkRcZS7V/Aj/DdM8P2fAPsxk
	+cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=QkBmgUjxM4x1Irm7RTfthwpq8OULiuJePAUqODxzeko=;
	b=gzoSCHK3t8HLN0fmxQmeFgq8Oi5aJtlt5d96eP1OYo8U6/Dxuny58epM4D+w8uddJh
	i0ddDP7uxe1e5Nr2DKrspI1cKLb3ZO2ECQyQEQcLV+dI6jvRcIC5RtIAjf/GR/nEh3va
	Lj4WY+E/cngsfYms5WCs3g5oerB42Fwf3ZwcPjcl9GASfY7dviJDj2ldgKwGQNbcH7Y9
	v5ddVjBZWtdavt9GuTjo+RfGeqUHStPT4ZzD3W678odE8e/Vs9dNOokvOVoSVw9NcAX9
	CxTH1J0SZ+3s/m3sF7z2+Q7zYIiOhQURSVwLrx96NL/w8PGAtdHkM1Sf1U4OYCWAMa9X
	CacQ==
X-Gm-Message-State: AIkVDXJ6gquuxr/P9N926DgQJedZs4FSE+OQ+fISyWrdkgA1SzPI2284Dcfc3IdPPiaO4q2qtIVkHrRvIZ5YXA==
X-Received: by 10.157.11.14 with SMTP id a14mr13632557ota.121.1484423110195;
	Sat, 14 Jan 2017 11:45:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.108 with HTTP; Sat, 14 Jan 2017 11:45:09 -0800 (PST)
From: Leon Woestenberg <leon@sidebranch.com>
Date: Sat, 14 Jan 2017 20:45:09 +0100
Message-ID: <CAMjhiJiu5isiTgwjrQtigKrvY7NzgdB5bsrn8bbxXu8q7W=bKw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: /usr merge, stateless systems and atomic updates w/ OpenEmbedded?
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
X-List-Received-Date: Sat, 14 Jan 2017 19:45:11 -0000
Content-Type: text/plain; charset=UTF-8

Hello all,

more and more I am liking the approach taken by SuSE snapper (incremental
but atomic updates using light-weight snapshots on BTRFS) and OSTree
(incremental atomic updates using a GIT like approach on the source, bsdiff
for delta updates).

These are targeting -- but also require -- systems that use the "/usr
merge" approach, which is a bit controversial, but seems to fit many
today's use cases; embedded, containers etc.

GNOME Continuous uses OpenEmbedded with OStree.
Automotive Grade Linux has started to use Yocto with OSTree.

Looking back in the mailing lists, I have seen interest and activities in
and around OpenEmbedded Core since 2013 to support /usr merge, but I am
unaware of any upstream support for this, or distro's that implement it. Am
I missing something?

Are there any developers here who do use OpenEmbedded with a /usr merge
approach?

Regards,

Leon.

Some random links I came across:
http://lists.openembedded.org/pipermail/openembedded-core/2014-December/099616.html
https://patchwork.openembedded.org/patch/89069/
http://lists.openembedded.org/pipermail/openembedded-core/2013-August/083595.html
https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
https://patchwork.openembedded.org/patch/111129/

