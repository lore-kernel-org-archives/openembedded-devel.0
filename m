Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S9hwv-0001Ei-6d
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 20:09:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2JFsIt7020729
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 08:54:18 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 19 Mar 2012 08:54:18 -0700
Message-ID: <4F6756A9.7020106@windriver.com>
Date: Mon, 19 Mar 2012 10:54:17 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4F62FFB7.5070401@nedap.com>
In-Reply-To: <4F62FFB7.5070401@nedap.com>
Subject: Re: remove dbg and dev packages
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
X-List-Received-Date: Mon, 19 Mar 2012 19:09:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/12 3:54 AM, Jaap de Jong wrote:
> Hi!
>
> is there an option (in local.conf?) to not build (or not add to the
> repository of) the dbg and dev packages?

You have to build the dev packages, otherwise you can't (cross) compile the 
software in the development environment.

The dbg packages are optional, but if you disable them then things may or may 
not be stripped and the filesizes on the target may increase.  (It's been a 
while since I tried it w/o dbg packages...)

Is there a reason why you don't want the dev and dbg packages to be generated? 
They should only be installed onto a target filesystem if you've requested them 
(or a package has a dependency on them).  Normal, non-dev, filesystems shouldn't 
be installed any of those components... if they are, there is a packaging bug in 
something.

See the meta/conf/local.conf.sample.extended:

# Uncomment this to disable the split of the debug information into -dbg files
# INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

(There are also other settings to control the specific mechanisms of the package 
split.. "debian" style or "fedora" style...)

--Mark

> Thanks!
> Jaap
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



