Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF95778F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 18:49:00 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c45so147745552qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=v9IMRoTaYQZatmpBNG7+KKlkcgs5J5ZJC26UiXqPRek=;
	b=iQrva4zI3AG2tOxqvQB03G1RzbFEdF1zYW6F0POzHmKnD7R4VgUkXWQFkVrx3zz27U
	PKg5tqundReBNy/aFyivOG1NEY9mRJ9QTGDfaQgjaImtitQ1pQY62FWcY0rXQgY636fs
	Judvv+ZvGO06/k26jOrumgN1nLH/iAvGYlNcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=v9IMRoTaYQZatmpBNG7+KKlkcgs5J5ZJC26UiXqPRek=;
	b=YrCuxyUm44SBt1CqqL0mnw5CpYJVENFYS4eJfLuC0g3K4nY3MFxsyfEEXuq3KBBgQP
	9oQGEJuSYJep588g7QtA2/uh55GjbhhwkGht7Lb8FI1V00wfhiEb2EDARRUX+bi+kDwU
	HHe78nW9SAAF1aZWjHBBkjo3lbMpXZROEU1YX1smwoCcQgKgo46XIe+/OpeiS+rypgCc
	sp8pcosznUQn9ch6UObkVRFlEVEvnxqdHW+1/MLyEkgciB47vQfXR5zCLxy2VL2gJADT
	0FW+Kqb8mdVbuu7il3ch+cLEmognhzojZk+jAGSynvvoBhJqD3sXxc1/ZNIDfcTBzt/C
	Mwmw==
X-Gm-Message-State: AN3rC/6P52QnUEJuRmq0raXCFZCwVs7oYxU5YWG8n66Hd4uYinCYD7fi
	Lb5WDU6c6fNniFTtUAGFC7nUhNwq/u/Ooi7Mtg==
X-Received: by 10.200.43.11 with SMTP id 11mr36290111qtu.72.1493146141525;
	Tue, 25 Apr 2017 11:49:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.84.168 with HTTP; Tue, 25 Apr 2017 11:48:40 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Apr 2017 20:48:40 +0200
Message-ID: <CAP71WjxfOz546gJkf-zT+CT1ErxZcczd+z_S+GQq_Aj+eYCxiA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: vdpau in morty
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
X-List-Received-Date: Tue, 25 Apr 2017 18:49:01 -0000
Content-Type: text/plain; charset=UTF-8

hi,

someone reported to me to that vlc failed to build in our builds/release,

ERROR: Nothing PROVIDES 'libvdpau'

I am trying to understand what has happened, it looks like several recipes
have recently added depends on vdpau,

  vlc: Add packageconfig for vdpau
  mpv: Add libvdpau to DEPENDS

 however the recipe does not exist in morty (only in master).

Am I missing anything here? or did we just miss the recipe?

cheers.

