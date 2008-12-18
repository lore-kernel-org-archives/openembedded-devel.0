Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDFvF-00084n-RX
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 11:16:02 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LDFqY-0005Tr-6V; Thu, 18 Dec 2008 18:11:21 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>)
	id 1LDFqr-0004PK-6i; Thu, 18 Dec 2008 18:11:29 +0800
Date: Thu, 18 Dec 2008 18:11:28 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081218101127.GF2135@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel@lists.openembedded.org,
	Chia-I Wu <olvaffe@gmail.com>
References: <20081218071901.GB2135@buddha.tw.openmoko.com>
	<gid3jt$nr2$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gid3jt$nr2$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: Re: openmoko-merges
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
X-List-Received-Date: Thu, 18 Dec 2008 10:16:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 18, 2008 at 10:02:53AM +0100, Koen Kooi wrote:
> On 18-12-08 08:19, John Lee wrote:
>> Hi,
>>
>> Please review john_lee/openmoko-merges.  I started from
>> holger/openmoko-merges then rebased it to oe.dev.
>
>> Not sure how long it's going to take.  My plan is to merge it this
>> Monday if it's okay...
>
> No. There's just too much in there too review in a week. Also, the stuff  
> I did review is just waaaaay to ugly to go in.
> Saying stuff will get fixed after the merge..... I've heard that before,  
> no-one actually fixes things after a merge.

I can put fastboot commits to another branch and remove them here if
these are controversial.

As mentioned before, what's in /etc/init.d/ , rcS and different
runlevels varies from distro to distro, machine to machine...  Would
it be better if I remove as many overrides as possible, we merge it to
oe.dev and fix problems there?  I don't think I can test all these
combinations alone.

> Most of these commits have two problems:
>
> * They can be done in a much better, but still OM specific way (e.g.  
> FILESPATH)

Okay, I think these should really be fixed.  You mean just the
initscript-openmoko commit, or there are more ?

> * They can be done in a generic way (e.g. alsa-states)
>
> To give some small examples:
>
> *  
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=john_lee/openmoko-merges&id=c0041ba98c41b320a36cbc5a66d0c8762e52ac62
>
> --- a/packages/alsa/alsa-state.bb
> +++ b/packages/alsa/alsa-state.bb
> @@ -20,6 +20,7 @@ inherit update-rc.d
>
> INITSCRIPT_PARAMS = "defaults 10"
> +INITSCRIPT_PARAMS_openmoko = "start 39 S ."
>
> Distro overrides are strongly discouraged and in this case not needed,  
> since it's using 'defaults', so an optimization is welcomed. In a  
> similar vein, the change to the initscript can be done to the regular  
> one, no need to add a special openmoko version.
>
> *  
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=john_lee/openmoko-merges&id=64b844ec5cc0c1a6acb1a97d1ea745f15eadb38d
> this it what the device table feature is for, see org.oe/dev/files/ for  
> the device tables, machines can have multiple ones if needed.

I agree.  Olv is already looking into that.

> *  
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=john_lee/openmoko-merges&id=db77b062d51be86b946a11efcadaf8e41fd41727
>
> If you modify FILESPATH you can reuse the initscripts from the  
> initscripts packages so you don't need to copy over unchanged ones.  
> Having said that, I think this should all be merged into the initscripts  
> recipe so everyone can benefit from it.
>
> I suspect review and merging would be easier if you 'collapse' the  
> patches per recipe or per directory. Reviewing all the seperate commits  
> will take too much time :(

Maybe it will be easier if people just review it by rebase first then
diff the content instead of read though commits, so one can clearly
see what will be changed, while still keeping the development process
recorded in the commit messages.


Regards,
John


