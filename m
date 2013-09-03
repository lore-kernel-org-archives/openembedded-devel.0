Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7EF6C053
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:49:14 +0000 (UTC)
Received: (qmail 26010 invoked by uid 89); 3 Sep 2013 15:49:04 -0000
Received: from unknown (HELO ?10.0.0.129?) (erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:49:04 -0000
Message-ID: <522604DB.4040602@movis.dk>
Date: Tue, 03 Sep 2013 17:48:43 +0200
From: "Emil R. Petersen" <erp@movis.dk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1378222415-13643-1-git-send-email-erp@movis.dk>
	<20130903154414.GD12638@axis.com>
In-Reply-To: <20130903154414.GD12638@axis.com>
Subject: Re: [meta-perl] libwww-perl_5.834: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:49:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Oh? Well I wouldn't have added them if I thought they were core modules.

MIME::Base64 has it's own CPAN entry: 
https://metacpan.org/release/MIME-Base64

And does not appear, immediately, to be part of the core distribution?

Or am I missing something?

On 03/09/13 17:44, Olof Johansson wrote:
> On 13-09-03 17:33 +0200, Emil Petersen wrote:
>> +RDEPENDS_${PN} += "libdigest-md5-perl \
>> +                   libencode-perl \
>> +                   libio-select-perl \
>> +                   libio-socket-perl \
>> +                   libmime-base64-perl \
>> +                   libnet-ftp-perl \
>> +                   "
> I notice that some of these modules are core modules
> (specifically the ones left in the quote), and I guess it would
> be better to depend on the perl-modules package instead (the
> package containing all core modules)? Otherwise this may require
> a great deal of maintenance when upgrading to newer releases.
>

