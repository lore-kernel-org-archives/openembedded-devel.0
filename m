Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 7860B731F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 14:24:48 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u1HEOmJ4021796
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 15:24:48 +0100
Received: from [139.22.34.133] ([139.22.34.133])
	by mail2.sbs.de (8.15.2/8.15.2) with SMTP id u1HEOmAN026747
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 15:24:48 +0100
To: openembedded-devel@lists.openembedded.org
References: <1455622845-14510-1-git-send-email-pascal.bach@siemens.com>
	<CAP9ODKqB8dnsThLVpK=+xC0XPagMGyvT-8Rma3LTP9rds4u7oQ@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <56C482B0.6020608@siemens.com>
Date: Wed, 17 Feb 2016 15:24:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqB8dnsThLVpK=+xC0XPagMGyvT-8Rma3LTP9rds4u7oQ@mail.gmail.com>
Subject: Re: [meta-webserver][PATCH 0/2] nginx: make mainline and stable version available
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
X-List-Received-Date: Wed, 17 Feb 2016 14:24:50 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Am 16.02.2016 um 12:51 schrieb Otavio Salvador:
> On Tue, Feb 16, 2016 at 9:40 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
>> Nginx has two supported branches, mainline and stable.
>> Currently meta-webserver contains the mainline version (1.9.x) of nginx.
>> For embedded system it might however be more appropriate to use the stable version (1.8.x)
>> which only receives security updates and bugfixes.
> Agreed; I also think 1.9 recipe ought to have default preference as -1
> so users take the stable by default.
>
I agree, but this will change the version for people using nginx not without setting preferred version.
Is this an issue? If not I will update the patchset and set DEFAULT_PREFERENCE for 1.9 to -1

