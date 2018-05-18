Return-Path: <texier.pj2@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 729EB75108
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 19:16:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f8-v6so17042978wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 12:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qGbqKsjUGvBlXu8sKh1Rhiw1IL80sWfuXTqtBrXKkCQ=;
	b=Fw4DthtCnA9zIYHldunUCPqIP4iGWYdJvIHYDJiNcnov+dAo2f5fHVXiRhcRYxrRfl
	/XKapIJU7XRK7W7jF7nh8MwJ/NXxxTdO/pVI6s3xripHDAcj7Wkw64Dmk2pBx8WURuA1
	MhGWn2GCaPxAOvHhxmXDub76Xc+YL999gdug+tONZBxPmtVnOSjYXkTRP58gXNx+04oS
	UBkSgZjUUVPwdkaLXaH43h1nW0oAwD5Vov3Og7Lm+5bQDOdrJ/xN5PLymm9KGb+qeT6A
	RoQnEKYrCBdixhPp30vQyglzHJ3G2PD7OOXBglKNZeBUiqByIOqm5TZjEZfictLsYGJf
	UHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qGbqKsjUGvBlXu8sKh1Rhiw1IL80sWfuXTqtBrXKkCQ=;
	b=GOPIv8o27/L0/64dRzve0A5NtaTxthg9GVQ4huEDOg+NHbY0dKQAMSppQIcgBgBkxg
	HPAil+HkWLsC+YSzI75Yp61lgfM/v+gdWvGpBmmajhHqPqG8fVMDnKwgGOO3As6vSkH6
	CWlqEqY0ztphaWn2RuvrqUf6y4RFN1owMv86Q2uVcB/Zpnh5UqaUi+erViwaRAROROWW
	n10ajRPKknxkHcL0hJPzZ5AbeSHQeaJO/KOYW39R4wXNa1eEPMhrW2C+OGhtxgZu6+nL
	B9/OAe0aZ9qwqqbuRDrxuoGzJD7AZMz5Y8UX909gEZhtCQ4f6CuCf0VTzVbC9SudvXIy
	3ISQ==
X-Gm-Message-State: ALKqPwf0wrRo+k/C10gXRqjv2Kr768t1UjsM8hzMIxvRNw6aQVMDjhd2
	NcRY6sA8X4uobCzvRUVkfShaHA0R/3QmzLRSEyA=
X-Google-Smtp-Source: AB8JxZr7W6gOcyMiolnVvFYjYRB9OmAsDZpp8lggeJHDAy3hO8rF+KCVk5lWoyhZaBuEd5Ef5gq2xcJwsdFg2TpLnks=
X-Received: by 2002:a50:9074:: with SMTP id
	z49-v6mr13384170edz.79.1526670970085; 
	Fri, 18 May 2018 12:16:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.218.78 with HTTP; Fri, 18 May 2018 12:16:09 -0700 (PDT)
In-Reply-To: <b6457a0a-e299-eec8-7b88-4a16aba1d869@gmail.com>
References: <1526407511-29723-1-git-send-email-texier.pj2@gmail.com>
	<1cb75da3-dd0b-ad66-69fe-9f4b521a4c9d@intel.com>
	<b6457a0a-e299-eec8-7b88-4a16aba1d869@gmail.com>
From: TEXIER Pierre-Jean <texier.pj2@gmail.com>
Date: Fri, 18 May 2018 21:16:09 +0200
Message-ID: <CALRtUqvommrkU=zu3ZNjktPwm=8DkJK7RWa+Y1-BDqR=8tRnPw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] minicoredumper: fixes for sysvinit and systemd
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
X-List-Received-Date: Fri, 18 May 2018 19:16:09 -0000
Content-Type: text/plain; charset="UTF-8"

Khem,

there is updated v3 for that patch here https://patchwork.openembedded
> .org/patch/150821/
>
> I would suggest to build upon that change on missing pieces if any. I have
> staged the v3 for now.
>

Indeed, v3 looks good (tested).

Thanks
Pierre-Jean

