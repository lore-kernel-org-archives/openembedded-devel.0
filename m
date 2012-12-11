Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiNDG-0008VQ-Q0
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 11:37:25 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so1868314wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=o/2qop0xddpr/0otdmZOHbc6ciz8BzPshT+O2Mqn/zI=;
	b=vIwAF/CZFb7qWqBdxxIuhrB0uLFQbIbqb00GyxcBMTSFwTWXyxUHwexuL9SJQeMm8Q
	/OtOakPHSdQRS48uqw8nAHBXST27XWfjV17Qca7/GtIa28TWfDXchQsYh7MbH2U21IxJ
	WlVzk7WKeWzGAL9I9qP+R8uZ70PT09cBQ0ler+s9iaVAgmnGAQbWwx9PrO7yen59nXHq
	rGcWB92twqd/JBkRnjd8cGDmE+nuput1mbbhx+fzzCzXn3+5GEzZpWrqDwgVLq0eUBb0
	cIeBfdYC9hIjlfrGjC5UI0btU3qsdSpIcHGmwpRSLHpC5Xqht3SQmE4kxSWSP9KJqhfF
	Wvkw==
MIME-Version: 1.0
Received: by 10.194.76.99 with SMTP id j3mr462100wjw.47.1355221370795; Tue, 11
	Dec 2012 02:22:50 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Tue, 11 Dec 2012 02:22:50 -0800 (PST)
In-Reply-To: <1354318947-12109-1-git-send-email-andrea.adami@gmail.com>
References: <1354318947-12109-1-git-send-email-andrea.adami@gmail.com>
Date: Tue, 11 Dec 2012 11:22:50 +0100
Message-ID: <CA+chaQfU+Ehchj46abTkNcAnFO5rCCq5xSeY85TSJHigHURQEw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.4: initial commit for Zaurus
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 10:37:25 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 1, 2012 at 12:42 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> * based on linux-yocto-standard cfg fragments
> * kernel 3.4 boots though size is too big
> * put together pending/submitted patches
> * for the moment DEFAULT_PREFERENCE = "-1"

This bbappend is changing D_P for all machines including qemu* where
it's causing downgrade from 3.4 to 3.2 unless P_V is specified.

Cheers,


