Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id E496071C21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 11:58:20 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id 83so112816464vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 04:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/l54avhcXusdCZrcz5dTOzuEbWSSMUjfFOMmPO2vXJA=;
	b=YzlmUXk2fEb91TESrXTfiKvD8zbvlkyjo0L75CSv+w30ZTfOvpFsTPHPiJgeEHHcBz
	DS02sk/N4amm6iUTHWVDOgYKnwSZiRztJYkMT4xxAIAis9tVp6DO4sStLfKlobxlDLqo
	wiDxZ5qTIWw85VD4XDn63EmvGLzU+ZnJFi1B/IRB8nDPzJZ26EwuGhOCuqgkR6ObqXkh
	olYsVsfBWM+7iho1IJUthTModCMkojJMzxBvPMH7pJC/1kuC4tMbyy2fL6/ShFhhixuQ
	yJ+ctug89YLs7+T4D3sZfXYuUGivHbHzWRkL+x8cmcbeQ2YXXv2im7Lp9gyjOZdfOrJc
	itPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/l54avhcXusdCZrcz5dTOzuEbWSSMUjfFOMmPO2vXJA=;
	b=Lfil2h5W/zOr0Kjyy7dKvt9MT6hPmI/fVrwsYU5pyCSU/M9bWsUM3GtMAVnwwC+qZn
	PhfkBVf7WGN4sQ3RSCv0o2IxLefAgzvSFBG4+TXjj5KQgVZWnl9dx7G0+Gef44Lt59Eo
	0BKywk+pm3H/ESLyRZ4hJgd+owY6XjvmF00ZUXZuRH2Osea9BkIC+KU1acL/g0eHAq+N
	Bobr/DCBcOiDS9LPPi2oKe2/AuEtbLpZn8Ba6AQRSs88xSvXUYzCyrQSXJFwGDf9bBsK
	iAHBSmGUMupBR/7nvEe6dNe0sG9Ww/Dsm5cja5U/yNOkdIheMILyQzdM+clBvN+Tm8YJ
	QJjw==
X-Gm-Message-State: ABUngvfy8dg+Zob1PVGeSJebWIqEQo36X7Fw8dKwY82WwwrMNX3/f1H88T+wttPyum0OzQ==
X-Received: by 10.31.157.216 with SMTP id g207mr440787vke.90.1477051101612;
	Fri, 21 Oct 2016 04:58:21 -0700 (PDT)
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com.
	[209.85.213.44])
	by smtp.gmail.com with ESMTPSA id u18sm1039446uau.0.2016.10.21.04.58.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Oct 2016 04:58:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f44.google.com with SMTP id 83so112815291vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 04:58:20 -0700 (PDT)
X-Received: by 10.31.210.130 with SMTP id j124mr439020vkg.17.1477051100033;
	Fri, 21 Oct 2016 04:58:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.49.82 with HTTP; Fri, 21 Oct 2016 04:58:19 -0700 (PDT)
In-Reply-To: <9d63d09b-a249-6a77-197a-15f84f2bce44@qt.io>
References: <20161020164624.12103-1-otavio@ossystems.com.br>
	<CAP9ODKpCA6tuXf7Kv=RA5kabS85ju50zt8zaCrzu0kXm6CnvNw@mail.gmail.com>
	<9d63d09b-a249-6a77-197a-15f84f2bce44@qt.io>
Date: Fri, 21 Oct 2016 09:58:19 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoOwCfNrC9tWD+1phO0Sw=hr_OYRFVNXmjM2pH1vYV60g@mail.gmail.com>
Message-ID: <CAP9ODKoOwCfNrC9tWD+1phO0Sw=hr_OYRFVNXmjM2pH1vYV60g@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@qt.io>
Cc: Samuli Piippo <samuli.piippo@theqtcompany.com>,
	Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5 PATCH] qmake5_paths.bbclass: Fix fonts installation path
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
X-List-Received-Date: Fri, 21 Oct 2016 11:58:22 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 21, 2016 at 4:47 AM, Samuli Piippo <samuli.piippo@qt.io> wrote:
> That looks like the correct path to use, but how does this fix the problem?
> OE_QMAKE_PATH_QT_FONTS doesn't seem to used anywhere in meta-qt5 any more
> and probably should have been removed together with the font packaging bits.

It did not fix it, indeed. We had a left over from a test so it hided
the issue. We are checking it now.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

