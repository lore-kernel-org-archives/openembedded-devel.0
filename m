Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id B76E6789F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 17:23:52 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id q184so7192002ywh.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Pec3EP2vJdOBDgXYAWf8ItoSM0ugjFcjLVRFyi7Sy0o=;
	b=fvjXHt+TK/xQEsO89ustv8wfgx7J/WJSY5nUGzE3Iqm05f5QdQ/Q5ZxD37Hswy692+
	HtcMwOn02AaZwWXbJbFa6lkVLc+gYTr+Q8MBVdcyq+FUSQRLi+XA9Ni7046cqsjLC+X8
	GpthnXBkkpAqACWV1OVlWzcBn++GGh4xmmMevlcsCoRez7ASEXJ2+Mxve5iGgLcOZc63
	GT9ClH1BY6TPtX5Qg7zmav9Tbkx9ZOV/TY2vXU+Hmv/+MjIfXAy+SaXtJ0aJ1UgJwpJm
	EW6+wBCNL7yXEJghFuJ66L6xS06BS9Mkwx0oHVsbpvELIrggJYe1SbCzxCU9wl4BpwF1
	Iotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Pec3EP2vJdOBDgXYAWf8ItoSM0ugjFcjLVRFyi7Sy0o=;
	b=k66nEcb9o085lY3oZOxGVTwVB67plwmZ9pbNK4FxfH+RV8tk4EJzYupxVvldAEL897
	EHfuR37B/MmMP14wE23BWd/37gxl//4kr1wT2CzrTCYfJBP/OO8/RBiiTBIL6VkmnQVT
	C0UsvegPNA/r3QpvzE1u/a0jUdmcFrnHnT6/qWIfdsOu7T+iivv8IR12fDyp44d52DY4
	mVR5EMONJFKd36pcMR/NOl4S+Tbgnn71M3fEQmc6Le/6+lLRdH2xs0OdDKYd+ZDeTAao
	GmRwmRsp/azKgKEVu0TyExRW9pimUbYsmxZLR+9gmR326Y96c2H4liYwGmN/7L+MRIsM
	AZJw==
X-Gm-Message-State: AElRT7HnFLv+MB2tvtn7cGcJsn7arSj8AgitGi0eifHAEOsyLJNk8kZU
	7XHUf5zKVbDqdJm6NSC1a9QV1u4wCRO18QgzEzg=
X-Google-Smtp-Source: AG47ELulFaObT6qwme63pHc+2KqCjsvgveZV/S8l4818a85j+p25dijt3nbuMNDHQ8ghcUz7RuGzXbU/Mys2FhPu1og=
X-Received: by 10.129.178.198 with SMTP id q189mr1945986ywh.272.1520357033545; 
	Tue, 06 Mar 2018 09:23:53 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Tue, 06 Mar 2018 17:23:42 +0000
Message-ID: <CAFeBWL6QUQZR-+YyMta6Nfu0qiDnCYoWqRQqRphgLnMQn2KF7w@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Has anyone been able to run minimal-qml (or any Wayland) example?
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
X-List-Received-Date: Tue, 06 Mar 2018 17:23:52 -0000
Content-Type: text/plain; charset="UTF-8"

I'd like to try out a Wayland example [1]. It can be found in
"/usr/share/qt5/examples/wayland".
Unfortunately I have not been able to run it on Rocko with AM57xx EVM from
TI.
Has anyone successfully ran this example application at all..? I just want
to be sure that there is a working example somewhere out there.

[1] https://doc.qt.io/qt-5.10/qtwaylandcompositor-examples.html

