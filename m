Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B160E6D1C1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2013 05:58:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9Q5x1sH020941
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 22:59:01 -0700 (PDT)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 25 Oct 2013 22:59:01 -0700
Message-ID: <526B5A13.1060507@windriver.com>
Date: Sat, 26 Oct 2013 13:58:43 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1382519652-15717-1-git-send-email-liezhi.yang@windriver.com>	<5269D91A.80707@windriver.com>
	<CAMKF1sowrZwPyQJxVcTfKxy4Bk=vvPnqa3mLBP14acg2aZPxog@mail.gmail.com>
In-Reply-To: <CAMKF1sowrZwPyQJxVcTfKxy4Bk=vvPnqa3mLBP14acg2aZPxog@mail.gmail.com>
Subject: Re: Updated V2 Re: [meta-webserver] [PATCH] cherokee: fix the installed but not shipped issue
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
X-List-Received-Date: Sat, 26 Oct 2013 05:59:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/25/2013 08:22 PM, Khem Raj wrote:
> On Thu, Oct 24, 2013 at 7:36 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> ERROR: QA Issue: cherokee: Files/directories were installed but not
>>> shipped
>>>     /srv
>>>     /srv/www
>>>     /srv/www/htdocs
>>>     /srv/www/htdocs/index.html
>>>     /srv/www/htdocs/images
>>>     /srv/www/htdocs/images/cherokee-logo.png
>>>     /srv/www/htdocs/images/default-bg.png
>>>     /srv/www/htdocs/images/favicon.ico
>>>     /srv/www/htdocs/images/powered_by_cherokee.png
>
>
> while you are at it can you see if  /var/www is better known place for
> this and add

Good idea, the V3 is comming.

* Changes of V3:

- Use /var/www/cherokee rather than /srv for --with-wwwroot as Khem suggested,
   this also used by Fedora 17.

// Robert

> the configure option to do so along with the packaging bits that you
> already have
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

