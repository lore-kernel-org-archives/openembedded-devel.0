Return-Path: <matt.hoosier@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1ACD0607A4
	for <openembedded-devel@openembedded.org>;
	Thu, 17 Mar 2016 11:07:01 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l68so111642688wml.1
	for <openembedded-devel@openembedded.org>;
	Thu, 17 Mar 2016 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=AWZl5CuTGzIj2NaGUy3uOlIlxVoDvtcojg6xlXuGUAM=;
	b=ikDDnd+fdQFcJE/HxY6S1qV0qK5UE2RDgNhtuudysD0hFpkcYw/uAs6ZvpfFuqZAjG
	bRoB/McRjarAedLXTLFFzdpmtx7cBdYNKQ+MLWBbxJUyFz3SpN+etni3m6IVJMuQ571E
	MshEMRpqhPnZ5vUfBJ99gCUgWjtrQO8SfEmWXZZDdGOBdoLeZRlYdzRgkpI+I4YkOdyJ
	Tt/E5HPYWxqa4BGS2jkGNbe9LfQRUsQfx8XQKrzjQAgOHM4cXLBw1kz0dQVUP/NvHqqO
	O/SvTIJzHSZbxMANcv6EhDHNGISIcMIcWay6nzhFShbbImACPQuJLD4wdI1apS3h3U/Y
	5btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AWZl5CuTGzIj2NaGUy3uOlIlxVoDvtcojg6xlXuGUAM=;
	b=Y2h7fgHoT5Sz3V6f96+6xMBWSTL5BaScGNA0l7i0YvDrnmwUrDYMh571q5mX9laipb
	YmhcEawzcVq7Gk4y9EWe+pm68Onup8Hwux1wMVBPhq9YuT3qlJ0BU8Syj0j+JPWBUCxo
	jWr84wSRlmhjH8c13UoOhqKjsc7ub2R0xUPoxVIGGe1VVQSSEj+jwpI9sCVbs6lR1Xmr
	QtFVbNVzCuAi5/t9Y/5yG9jXS4VXXmTglTPB4jfQpMrRJC7+bwVmMqjb35wGq7B6hxzj
	W5ZtQXAURpc8Ds5LDMAlXDWvfub2qivalEHNEdjr5dm5RbssSpDMd9X5gZFxVjyu+7qF
	FoSA==
X-Gm-Message-State: AD7BkJKeXT22MptoKpyE89h81ib87ovXH3qUGLQnh+DoZ2i8wb3dAwq0+hwxSDHF0KsXpOxNcIf4W8rnrGN0Bg==
X-Received: by 10.194.216.99 with SMTP id op3mr9444771wjc.26.1458212822190;
	Thu, 17 Mar 2016 04:07:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.0.83 with HTTP; Thu, 17 Mar 2016 04:06:22 -0700 (PDT)
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Thu, 17 Mar 2016 06:06:22 -0500
Message-ID: <CAJgxT39h8BPhuaEME6ueMJV8YgbtsijAEMt3h-k-qhpbNtFm+w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@openembedded.org>,
	yocto@yoctoproject.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] [meta-mingw] Any success using these two layers together?
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
X-List-Received-Date: Thu, 17 Mar 2016 11:07:03 -0000
Content-Type: text/plain; charset=UTF-8

Does anybody have experience using meta-qt5 and meta-ming together to
produce a usable SDK including Qt development tools for use on a Windows
host together?

The stock recipes for producing the nativesdk flavors of certain Qt
packages would seem to require some modification from vanilla meta-qt5
upstream to be able to target mingw.

Cheers,
Matt

