Return-Path: <henry@pericynthion.org>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 07CA96E668
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 19:14:52 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id 9so13053088qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pericynthion-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=QO7aTkWCfOJy8hZtwD2WKyOs4oiV7foBOypU2fnd410=;
	b=o264DfBuKogzjzhaArhsvzrZHD2L1XTqhtoFaeevJfRk44eIQzZ+OtZBTP4HXuDm/D
	Nu9hoQSN45kmSHq8jBpX622VMsekuFBqvjS9JAv3IcH5txdCx9r9DLAM+DgV4AKbsbDG
	+d8UUvsos04etiUPiYUXzSnE6oGiqhHeOFRYqo9cZB3RnkV6zH0a9deyU8vjeWu9KOrJ
	kg15zaGrLPDox/s6IfVElI2c93w6weUqCmDwj1FILDMw32IEs87VkcjkFr7/aTOv/Nyl
	B0IDGe69vqxJbu+NOaigJ5MhGJHmCOTT+d2ZE804xHX+PflBxXslsoQ3A+QNRhhKYnYj
	fdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=QO7aTkWCfOJy8hZtwD2WKyOs4oiV7foBOypU2fnd410=;
	b=XcrFvSfj0n4qOqr6ErjHqHiWJdBJUqq3J7xMO/W80ZAymvtx5U4O+aeWERRO9fmyfe
	W8pFBcpmKot6ZyiBC9J5jyBREmy1aij40aZsWcvX9GWCj79XZrCmtKqeicEhDUo2ZUns
	NaMb4Q2eX7H7Maxc1gm+TMl75a2bMcoH3f6g3vZO8i0j0Kv0qGIJk2Ae55It9JxlGl4f
	46mVM0aGEi8vwBMmCK2Qgue7WA3oPmvqyhQlv4urGuHiIBeohSenQeZhocXEJ1sxlS/B
	XIyHy1WcW3g9+CqybP7/fFcOsFOOfuOuTAJPejwwVXF2XQ2TiH9ZmS7xyvezpt6f/Eo3
	z4mA==
X-Gm-Message-State: ALyK8tJurFGconOyqXqFtNx+Bdm4Ef1cA4enGnqElfnz7kroPQzHvCIUrdSa+42MDkidpvsVw7PWQU19SiZ1Lg==
X-Received: by 10.200.56.13 with SMTP id q13mr9696256qtb.29.1465499693163;
	Thu, 09 Jun 2016 12:14:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.107.131 with HTTP; Thu, 9 Jun 2016 12:14:33 -0700 (PDT)
In-Reply-To: <1465499198-340-1-git-send-email-henry@pericynthion.org>
References: <1465499198-340-1-git-send-email-henry@pericynthion.org>
From: Henry Hallam <henry@pericynthion.org>
Date: Thu, 9 Jun 2016 12:14:33 -0700
Message-ID: <CAAxKAvJxiQwVif67O6tXyPsDGfF=Wk4kD0CES3+bZnhDWUQNng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] chrony: Versatile implementation of NTP
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
X-List-Received-Date: Thu, 09 Jun 2016 19:14:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 12:06 PM, Henry Hallam <henry@kittyhawk.aero> wrote:
> chrony is an alternative to ntpd.  In particular it may be useful
> for quasi-realtime embedded systems that have a pulse-per-second
> time reference available and need to rapidly synchronize to it after
> boot, which appears to be unachievable with ntpd.

This is my first attempt to contribute to yocto/openembedded, so any
and all feedback (stylistic or otherwise) would be greatly
appreciated.

Thanks, Henry

