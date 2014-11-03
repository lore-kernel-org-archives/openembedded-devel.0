Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 1021 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Nov 2014 18:20:32 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id DA50665D3C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Nov 2014 18:20:32 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1XlLyS-0002jh-D1; Mon, 03 Nov 2014 19:03:28 +0100
Received: from host-87-242-31-61.prtelecom.hu ([87.242.31.61]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>)
	id 1XlLyK-0001uP-QC; Mon, 03 Nov 2014 19:03:26 +0100
Message-ID: <5457C365.7020406@pr.hu>
Date: Mon, 03 Nov 2014 19:03:17 +0100
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <ab38d1872c37433981e9fd312b842a54@BLUPR05MB037.namprd05.prod.outlook.com>	<4253192.vXvCSCqcaf@peggleto-mobl5.ger.corp.intel.com>
	<39739be97a8540f388f124d4b3167ec2@BLUPR05MB037.namprd05.prod.outlook.com>
In-Reply-To: <39739be97a8540f388f124d4b3167ec2@BLUPR05MB037.namprd05.prod.outlook.com>
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam detection software, running on the system "prspamd3.pr.hu",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  2014-11-03 17:08 keltezéssel, Bryan Evenson írta: > Paul,
   > >> 
 
 Content analysis details:   (2.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.2 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  3.5 BAYES_99               BODY: Bayes spam probability is 99 to 100%
                             [score: 1.0000]
  0.2 BAYES_999              BODY: Bayes spam probability is 99.9 to 100%
                             [score: 1.0000]
 -1.3 AWL                    AWL: From: address is in the auto white-list
X-Scan-Signature: 9427e6a40340fb9271adf0ec4aff0cba
X-Spam-Tracer: backend.mail.pr.hu 2.2 20141103180326Z
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>
Subject: Re: php: museum.php.net is broken - change recipe SRC_URI?
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
X-List-Received-Date: Mon, 03 Nov 2014 18:20:40 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

2014-11-03 17:08 keltezéssel, Bryan Evenson írta:
> Paul,
>
>> -----Original Message-----
>> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
>> Sent: Monday, November 03, 2014 10:46 AM
>> To: Bryan Evenson
>> Cc: Martin Jansa; koen@dominion.thruhere.net; openembedded-
>> devel@lists.openembedded.org
>> Subject: Re: [oe] php: museum.php.net is broken - change recipe SRC_URI?
>>
>> Hi Bryan,
>>
>> On Monday 03 November 2014 14:03:42 Bryan Evenson wrote:
>>> The official PHP archival version download site,
>>> http://museum.php.net, has been down at least since the beginning of
>>> October.  This is a problem for daisy and older branches if a build
>>> attempts to fetch PHP.  I expect this site will be back up again
>>> sometime, but from reading the conversation on the related PHP bug
>>> report (https://bugs.php.net/bug.php?id=68130) I do not believe
>>> http://museum.php.net can be viewed to be a reliable archive in the
>>> future.  I see that dizzy changed the SRC_URI to use
>>> http://www.php.net/distributions for the main download.  I did some
>>> testing and it appears that PHP versions that are about a year old or
>>> less are available from http://www.php.net/distributions.  So we can
>>> assume that a year from now the dizzy branch SRC_URI will need to change
>> to something else.
>>> I'd propose changing the SRC_URI to something that will not change
>>> over time.  My suggestion would be the PHP distributions Git
>>> repository located
>>> here: http://git.php.net/?p=web/php-distributions.git;a=summary.  This
>>> is the path suggested in the related PHP bug mentioned earlier.  The
>>> disadvantage is that the SRC_URI would refer to a file on a specific
>>> tag, so the SRC_URI would be specific for each PHP version.
>>>
>>> Any further suggestions on how to handle this?  If the SRC_URI does
>>> get updated, how many branches back should the change be made?
>> So we do have mirrors that can help with this, unfortunately with the OE
>> mirror (as opposed to the Yocto Project one), its population is not automatic,
>> so you have to request that new archives get added. I'm not sure it would be
>> practical to change this either.
>>
>> Why php thinks it's a good idea to distribute these tarballs in a single place in
>> a git repository but not in a simple flat HTTP location is a bit beyond me.
>> Fetching directly from git in this situation wouldn't be ideal as it'll end up
>> effectively fetching all of the binaries down when cloning the repo; however
>> I guess you could download a single file with:
>>
>> SRC_URI = "http://git.php.net/?p=web/php-distributions.git;a=blob;f=php-
>> ${PV}.tar.xz"
> Not exactly.  It looks like the old versions that are no longer supported get deleted from php-distributions.git, so HEAD doesn't have knowledge of all PHP versions.  For example, this link: http://git.php.net/?p=web/php-distributions.git;a=blob;f=php-5.4.22.tar.bz2 as of today will download php-5.4.22.  But this link: http://git.php.net/?p=web/php-distributions.git;a=blob;f=php-5.4.21.tar.bz2 just reports that it cannot find the file.
>
> As far as fetching php-5.4.14 (version used for daisy and older) I think this URL will work: http://git.php.net/?p=web/php-distributions.git;a=blob;f=php-5.4.14.tar.bz2;h=0d950f179d586bb1d0e879e0d4aa3a5140e8d5f5;hb=3dd2f12609fc8a730d7cf341a932f6c7b241f03c.  Ugly, but it works.

What's wrong with this?

SRC_URI =
"http://php.net/get/php-${PV}.tar.bz2/from/this/mirror;downloadfilename=php-${PV}.tar.bz2"

>
> Would it make more sense to start cloning the source Git repository at https://git.php.net/repository/php-src.git instead of the tarball?  It would download a lot more data, but at least we should be able to use a single SRC_URI for each minor PHP version.
>
> Regards,
> Bryan
>


