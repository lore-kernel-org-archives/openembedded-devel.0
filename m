Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 582 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Apr 2016 06:47:50 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3EA6FFED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:47:49 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id u3C6c3EV028910
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 08:38:03 +0200
Received: from [139.16.79.206] (MD1FZU9C.ww002.siemens.net [139.16.79.206])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u3C6c34w011373
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2016 08:38:03 +0200
To: openembedded-devel@lists.openembedded.org
References: <1460419857-8128-1-git-send-email-derek@asterius.io>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <570C97CB.2000202@siemens.com>
Date: Tue, 12 Apr 2016 08:38:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1460419857-8128-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-webserver][PATCH] nginx: update to 1.9.14
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
X-List-Received-Date: Tue, 12 Apr 2016 06:47:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 12.04.2016 02:10, Derek Straka wrote:
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.14.bb
> @@ -2,11 +2,11 @@ require nginx.inc
>  
>  # 1.9.x is the current mainline branches containing all new features
>  # 1.8.x branch is the current stable branch, the recommended default
> -DEFAULT_PREFERENCE = "-1"
> +#DEFAULT_PREFERENCE = "-1"
>  
This effectively reverts making 1.8 the default version used. Is this intended?
Pascal

