Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1Tbtvv-0004Z6-Or
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 15:08:43 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Fri, 23 Nov 2012
	14:54:35 +0100
X-TM-IMSS-Message-ID: <168910cf0021e904@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 168910cf0021e904 ;
	Fri, 23 Nov 2012 14:54:25 +0100
Message-ID: <50AF801A.7000502@nedap.com>
Date: Fri, 23 Nov 2012 14:54:34 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <50AE3D1A.90106@nedap.com>
In-Reply-To: <50AE3D1A.90106@nedap.com>
Subject: Re: sstate-cache
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
X-List-Received-Date: Fri, 23 Nov 2012 14:08:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/22/2012 03:56 PM, Jaap de Jong wrote:
> I have a handful of openembedded clones on a single machine and I would
> like to use as little diskspace as possible, so I'm wondering if it is
> possible to share the directory build/sstate-cache among these different
> clones?
>
To be a bit more precise, these are the variables to work with:

SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
SSTATE_MIRRORS ?= "\
file://.* http://someserver.tld/share/sstate/ \n \
file://.* file:///some/local/dir/sstate/"

Does every clone (which might be translated at the same time) has to 
have its own local SSTATE_DIR?
Or is it ok to point every clone to one single directory, like: 
SSTATE_DIR ?= "${HOME}/sstate-cache"?
Or should I use SSTATE_MIRRORS for that purpose?

Thanks!
Jaap


