Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NBqy1-0002Gw-Ms
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 15:29:40 +0100
Received: (qmail 13371 invoked by uid 1003); 21 Nov 2009 14:28:09 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 21 Nov 2009 14:28:09 -0000
Message-ID: <4B07F8F8.3060802@balister.org>
Date: Sat, 21 Nov 2009 09:28:08 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1258782956.5424.17.camel@gnutoo-desktop>
	<alpine.LFD.2.00.0911210112500.25956@localhost>
In-Reply-To: <alpine.LFD.2.00.0911210112500.25956@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: wrong checksum for libsdl-mixer-1.2.9
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
X-List-Received-Date: Sat, 21 Nov 2009 14:29:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2009 01:15 AM, Robert P. J. Day wrote:
> On Sat, 21 Nov 2009, GNUtoo wrote:
>
>> hi, I've a bad checksum for SDL_mixer-1.2.9.tar.gz
>> I've tried to download it a second time and the bad checksum persist:
>> NOTE: Handling BitBake files: / (7861/7861) [100 %]
>> NOTE: Parsing finished. 7056 cached, 461 parsed, 344 skipped, 0 masked.
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> NOTE: Executing runqueue
>> NOTE: Running task 885 of 1396 (ID:
>> 209, /home/embedded/oe/org.openembedded.dev/recipes/libsdl/libsdl-mixer_1.2.9.bb, do_fetch)
>> NOTE: fetch http://build.shr-project.org/sources/SDL_mixer-1.2.9.tar.gz
>> --2009-11-21 06:37:49--
>> http://build.shr-project.org/sources/SDL_mixer-1.2.9.tar.gz
>> Resolving build.shr-project.org... 78.40.125.6
>> Connecting to build.shr-project.org|78.40.125.6|:80... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2009-11-21 06:37:50 ERROR 404: Not Found.
>>
>> NOTE: fetch
>> http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
>> --2009-11-21 06:37:50--
>> http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
>> Resolving www.libsdl.org... 69.163.143.10
>> Connecting to www.libsdl.org|69.163.143.10|:80... connected.
>> HTTP request sent, awaiting response... 200 OK
>> Length: 2690766 (2.6M) [application/x-tar]
>> Saving to: `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz'
>>
>> 100%[====[...]=====================>] 2,690,766    746K/s   in 4.5s
>>
>> 2009-11-21 06:38:00 (588 KB/s) -
>> `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz' saved [2690766/2690766]
>>
>> NOTE: The MD5Sums did not match. Wanted:
>> 'a9eb8750e920829ff41dbe7555850156' and Got:
>> '09eb4585f46d3527fe7fce8af8f9e591'
>
>    that second checksum is, in fact, the correct one for that tarball.
> and the sha256sum in conf/checksums.ini also doesn't match the one for
> that tarball.  if that used to be correct, does that mean someone has
> replaced a tarball with a different but identically-named one?

It can also mean the download is corrupt, try removing the file (and the 
.md5 file) from the OE sources dir and restarting the build.

Philip


>
> rday
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


