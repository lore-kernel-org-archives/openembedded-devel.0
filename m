Received: from [209.85.162.182] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1KqNJm-0007Di-Vw
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Oct 2008 09:30:47 +0200
Received: by el-out-1112.google.com with SMTP id s27so1226373ele.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2008 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=+T6Vb9eJnVWveKsHjpB8tOuM8WgpLHRPNrsnTasHns0=;
	b=vQ/x6HesABQPZ5spnycapFLoAdQ+qmexZva1M1eY6Dw/XdWSlwhc4NMXZBhQTUBBsB
	mJF4ZjXz0WRZJoB4pebPgpfHLiz9BNqQKF8bqyN45yBda95/hT5RFpDWT1O+RPdLkBxI
	AI60q/vfzoYxctkH9LtNAEB/l1C/jVUWU9TJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=LAMOMon/DgMoAdU2TarF4eHcalvYffuRF5qY0fhW0J4JbRDh3naWAUtjVzxuapVqtO
	z7Qy6gLLJmuEnpkKT3NBRKidMib/ABGogap3cs39U7WEbbXNFaxcfa95ZzEXKrWv+Zui
	GKR8ces+2ozJ8VAj1+2apFQSEvYcPa66hs1AE=
Received: by 10.90.96.15 with SMTP id t15mr2592665agb.91.1224141934509;
	Thu, 16 Oct 2008 00:25:34 -0700 (PDT)
Received: from ?192.168.35.8? (mir-nil-pat-118-150.wustl.edu [128.252.118.150])
	by mx.google.com with ESMTPS id c78sm1258737hsa.17.2008.10.16.00.25.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Oct 2008 00:25:33 -0700 (PDT)
Message-ID: <48F6EC69.6080007@gmail.com>
Date: Thu, 16 Oct 2008 02:25:29 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20081012031612.E518B189328@amethyst.openembedded.net>
	<48F325C6.9040206@gmx.net>
In-Reply-To: <48F325C6.9040206@gmx.net>
Subject: Re: [oe-commits] : libxml2: bump to 2.7.2
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
X-List-Received-Date: Thu, 16 Oct 2008 07:30:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2008 05:41 AM, Robert Schuster wrote:
> Hi,
> first: I am completely open to updating to newer program and or library
> versions.
> 
> However
> 
> OE GIT Trial schrieb:
> 
>>  packages/libxml/libxml2_2.6.27.bb                  |    3 ---
>>  packages/libxml/libxml2_2.6.29.bb                  |    4 ----
> 
> Running
> 
> 	grep -r "libxml2" *
> 
> in conf/
> 
> results in:
> 
> distro/chinook-compat.conf:PREFERRED_VERSION_libxml2          = "2.6.27"
> distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_libxml2
> ?= "2.6.29"
> distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_libxml2-native
> ?= "2.6.29"
> 
> I would like to be asked or informed before stuff is removed from the
> repository that is used by distros I maintain.

Rob,

Sorry about that. Please revert that as you see fit. I'm not close to a 
build machine any time soon.

Regards
Gordon


