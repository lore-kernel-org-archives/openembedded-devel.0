Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C1D2C6D134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 12:22:33 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id u16so6351885iet.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 05:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=jJNm3vnXTnjjS85abQUqJnG80ryJC37BqKTHTEpHqwU=;
	b=UwPDLc+d9Pzrxd79lyYz0JkzoIjdR6AzI6KhdFFMG8at8WVTL7/odk0xgW58S6ik1u
	g2HAmg8wtU7Iizd8yFFNimMBn6IRL+ZJzPDwbytvgN1c28v57NrYwDyaRRVL67hMnI+/
	RI0jRlAwB1VNCF9dPDAClW9BW0XPy7lpu0qK8+uW0gFbeyBp0EKtVqpOZeyrqY5Tk+jE
	JeGaHKEe0Driwoa75orafwrbVnnsBtQEneD9479VhGrs2cUv3jfYs+Fe35IXFMVZN29y
	qkE3IFVYGEzMAV2SBkiCeI4LdANU3Fhx6l3MZuY58H+twpWhODYp6iYC6FLK39nK5xe/
	WhGg==
X-Received: by 10.50.22.67 with SMTP id b3mr1893249igf.39.1382703755601; Fri,
	25 Oct 2013 05:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Fri, 25 Oct 2013 05:22:05 -0700 (PDT)
In-Reply-To: <5269D91A.80707@windriver.com>
References: <1382519652-15717-1-git-send-email-liezhi.yang@windriver.com>
	<5269D91A.80707@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2013 05:22:05 -0700
Message-ID: <CAMKF1sowrZwPyQJxVcTfKxy4Bk=vvPnqa3mLBP14acg2aZPxog@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 25 Oct 2013 12:22:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 24, 2013 at 7:36 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> ERROR: QA Issue: cherokee: Files/directories were installed but not
>> shipped
>>    /srv
>>    /srv/www
>>    /srv/www/htdocs
>>    /srv/www/htdocs/index.html
>>    /srv/www/htdocs/images
>>    /srv/www/htdocs/images/cherokee-logo.png
>>    /srv/www/htdocs/images/default-bg.png
>>    /srv/www/htdocs/images/favicon.ico
>>    /srv/www/htdocs/images/powered_by_cherokee.png


while you are at it can you see if  /var/www is better known place for
this and add
the configure option to do so along with the packaging bits that you
already have

