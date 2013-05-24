Return-Path: <kirgene@gmail.com>
Received: from mail-qe0-f51.google.com (mail-qe0-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id B3E1260959
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 00:54:50 +0000 (UTC)
Received: by mail-qe0-f51.google.com with SMTP id nd7so2283984qeb.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2013 17:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=r1RbMxMimw7CYnWV+csOlnVY+uTYd6KEMMuVmfDjvx0=;
	b=Nk71sxQSMi9+4UjV+dmibKupL4vZ7v7ylnwWMHl5XVvJ0sKGHHggllaj6rCixizJ39
	syhiqpE0D2CGy/p0/KZLnJnYO7RpIbdBx0qdSg2qWENklpO47aHYSwFC/FW7gviLqw2m
	PEFQJb+S48WMFGkY71euDRpINZU5QXhfExnSYkHtF25fcB9/2wBAxbd3JngVOWIvfgr9
	0xlWEgsjeNcwjnNXx5ECZn38eawGMTtoUlZDfbwIHp6C11yZ+lh/sWtdSA++VFNv0FRk
	aNJAQKgymcWj/4wQnUvb9a5hx4FvWnIgG16kQwngXzC03DYkxlY5mc3ZmJhlMaZbM1Ao
	JFkw==
MIME-Version: 1.0
X-Received: by 10.224.119.83 with SMTP id y19mr13806834qaq.7.1369356891601;
	Thu, 23 May 2013 17:54:51 -0700 (PDT)
Received: by 10.49.86.33 with HTTP; Thu, 23 May 2013 17:54:51 -0700 (PDT)
In-Reply-To: <CADV-EXEWOKenwkeTmPJQQqSbwwDa0P=fi=Ne=hEYqOcU6eDdhQ@mail.gmail.com>
References: <CADV-EXEWOKenwkeTmPJQQqSbwwDa0P=fi=Ne=hEYqOcU6eDdhQ@mail.gmail.com>
Date: Fri, 24 May 2013 03:54:51 +0300
Message-ID: <CADV-EXEPQEhcwvJEvXQp_TKqq+OvS1OYHogJ5c=0KCXoBOvEdg@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: gpsd: GPS is unusable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 May 2013 00:54:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I've installed gpsd package from meta-openembedded layer and get
following errors in syslog from systemd-udevd:

failed to execute '/lib/udev/gpsd.hotplug.wrapper'
'/lib/udev/gpsd.hotplug.wrapper': No such file or directory

There is no 'gpsd.hotplug.wrapper' file anywhere on the disk.

So I can't use GPS device.

Best regards,
Yevhen

