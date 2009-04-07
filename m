Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LrGjt-0005NZ-R8
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 21:14:37 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LrGh2-0006Jw-0p
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 19:10:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 19:10:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Apr 2009 19:10:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Apr 2009 21:10:32 +0200
Message-ID: <grg8f8$p48$1@ger.gmane.org>
References: <200904071212.18247.mickey@vanille-media.de>	<20090407174351.GD11203@denix.org>
	<grg59h$e3q$1@ger.gmane.org> <20090407184921.GE11203@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <20090407184921.GE11203@denix.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPLOY_DIR / packaged staging / persistent toolchains
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
X-List-Received-Date: Tue, 07 Apr 2009 19:15:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-04-09 20:49, Denys Dmytriyenko wrote:
> On Tue, Apr 07, 2009 at 08:16:16PM +0200, Koen Kooi wrote:
>> On 07-04-09 19:43, Denys Dmytriyenko wrote:
>>> if you don't have opkg in your system PATH, you may need to
>>> remove opkg packages from pstage to force rebuilding and installing it.
>>> Its a
>>> chicken and egg problem - opkg-native binary is in .ipk and in order to
>>> install and use it you need opkg-native...
>>
>> That's not true:
>>
>> PSTAGE_PKGMANAGER = "stage-manager-ipkg"
>>
>> [..]
>>
>>      pkgmanager = bb.which(path, 'opkg-cl')
>>      if pkgmanager == "":
>>          pkgmanager = bb.which(path, 'ipkg-cl')
>>      if pkgmanager != "":
>>          bb.data.setVar("PSTAGE_PKGMANAGER", pkgmanager, d)
>>
>>
>> stage-manager-ipkg is a shell script (flashback to the original ipkg
>> implementation), which will get used till opkg-cl is found in $PATH.
>
> Hmm, good to know - thanks! I wonder why it doesn't always work, as reported
> on irc? The workaround so far was to delete the opkg package from pstage...

The script doesn't work too well, but it gets the job done. Maybe try 
'bitbake opkg-native' before trying a build from 'scratch'. It would be 
good to debug this.

regards,

Koen




