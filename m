Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id A6BBB60797
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:41:55 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id m124so92045600wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=buuwc7bf+8VGUyi9XTD4lcln0VkEPa+wdGyVa2zg3YA=;
	b=zNBi83dh8BofLpV1QXosPOAcuiMCR6lgZ3hj6ZVv9LLM9nB1YXxP4bM3kdjqx5VZNf
	RRAV4ByybkKZdbdViTMQZzmO8gkGllYVBSMYYPfL5peqjNOeeSTmovf4iGz2GDwM9ZmX
	0sfJgtqPRBsI6FzXjhLnx/YsnuGKOQUpq+tLYgc3SI2z0Q6RSHZ3Zsc63sfGwOc55TtU
	BNXftq8NelDMywFi0RUNBZMJdPDvNQXQrsfMGzjcBlrTVHKlzavYL+CCNoSgd71L+aBH
	ZDM7lNG1dsJLupq5+4MS2BSmAtVocp0oUFwU5zM3NxgiixDYJMNX/0jXnXmeNsLgzxe+
	1IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=buuwc7bf+8VGUyi9XTD4lcln0VkEPa+wdGyVa2zg3YA=;
	b=PQT4jor0DQu9tsJDWkZektSvWgMPBSbKYvIMJi3RBa1eWgyxdnj2AKSd9xEwGiYjmn
	pMCsHAkUXoQCXuYXdM3sEjl4l37vKluZI2Sp4uioYmx49PRvset7Jsczj258uN7u2w8W
	g5UFy3PnQkxUZfHUS2I3/WzbFGmM+y82x8IjJQ6pdhZCzZgSxH1R/cnMI+JaeACrOH+X
	QYvu+ql0l4fKJI8Hok9IJeCwMiOmGoOA6H7AwBrLDsSCdQzkqrpsdLvH6dXLgM3Ugfow
	9quTA4YcW805vxvaAavidM1O3MlQ1mVcw4A+Hp9nHLZulweoNzPg9iYlY05809/sM3Z0
	b01A==
X-Gm-Message-State: ALyK8tK553FvUVZBcq/uwgsp5hXFw0O3U15oSkvYRjal3KHqcpZFR5AlbIyTd2ezPKterc8NVcik365eu3bDnQ==
X-Received: by 10.194.75.169 with SMTP id d9mr957082wjw.167.1465548116191;
	Fri, 10 Jun 2016 01:41:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.59.71 with HTTP; Fri, 10 Jun 2016 01:41:55 -0700 (PDT)
In-Reply-To: <575A7BEB.1060808@mlbassoc.com>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
	<CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
	<20160609181613.GB2586@jama>
	<CAHPquwPKh0hgOuvHvB0KYVfU0PhtR_sZ8vKO8EgH_YgsZrwtkA@mail.gmail.com>
	<575A7BEB.1060808@mlbassoc.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Jun 2016 10:41:55 +0200
Message-ID: <CA+chaQemhEo7Y2o3AfAO6CG6nxtH80bw6qFm-YwPS=CbtzxkHQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [OE-core] the fate of Vala in OE
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
X-List-Received-Date: Fri, 10 Jun 2016 08:41:57 -0000
Content-Type: text/plain; charset=UTF-8

You're reading it from wrong side.

This shows what vala-native needs, not what needs vala-native.

On Fri, Jun 10, 2016 at 10:35 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2016-06-10 02:04, Petr Nechaev wrote:
>
>> I can see that libsecret in oe-core depends on vala though for testing
>> only.
>>
>> If moving to meta-oe is community's decision, I will prepare the patch.
>>
>>
> It looks like a lot of things need vala (or more precisely vala-native).
> I just tried a build which included meta-browser (I know this isn't OE-core
> but _is_ very common) and saw this dependency chain:
> "vala-native" -> "libxslt-native" [style=solid]
> "vala-native" -> "glib-2.0-native" [style=solid]
> "vala-native" -> "autoconf-native" [style=solid]
> "vala-native" -> "automake-native" [style=solid]
> "vala-native" -> "libtool-native" [style=solid]
> "vala-native" -> "gnu-config-native" [style=solid]
> "vala-native" -> "pkgconfig-native" [style=solid]
> "vala-native" -> "flex-native" [style=solid]
> "vala-native" -> "bison-native" [style=solid]
>
> In this case, I think vala (vala-native) deserves OE-core status.
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

