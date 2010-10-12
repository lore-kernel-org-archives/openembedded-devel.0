Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1P5hzp-0001Dv-27
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 18:46:40 +0200
Received: (qmail 2975 invoked by uid 1003); 12 Oct 2010 16:46:06 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Oct 2010 16:46:06 -0000
Message-ID: <4CB490CD.50500@balister.org>
Date: Tue, 12 Oct 2010 12:46:05 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc13 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CB48C51.9000403@mentor.com> <i9234d$dh4$1@dough.gmane.org>
In-Reply-To: <i9234d$dh4$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Remove older freetype versions
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
X-List-Received-Date: Tue, 12 Oct 2010 16:46:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2010 12:41 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 12-10-10 18:26, Tom Rini wrote:
>> Hey all,
>>
>> I'd like to remove all versions of freetype before 2.4.3.  The only dist
>> which is pinning freetype currently does so via
>> conf/distro/include/preferred-opie-versions.inc and that pins to a
>> non-existent version (it's using OPIE_VERSION which seems wrong).  All
>> of the previous versions have various security issues, including
>> remotely exploitable ones.  Only the very oldest version we have as a
>> D_P -1 so everyone was using 2.3.12 and will be going up to 2.4.3
>> (libraries are compat).
>
> Speaking of freetype, the bytecode patent expired, so we can turn that
> on and get nicer text :)
>
> And removing older freetypes is a good idea

I'd like to point people at openwmbedded/removal.txt. This would be a 
good place to schedule things for deletion. As in I added a new version 
and made it active, but do not want to delete the older version for a 
couple of months just in case something crops up. So leave a note in 
removal.txt to look are removing a recipe on a certain date.

Philip


