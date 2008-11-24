Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L4bDI-0002EO-Vc
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 14:10:53 +0100
Received: by qw-out-1920.google.com with SMTP id 5so339452qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2008 05:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=wbJoYP1w20wPUaqtb2UJSWDLG01Q58Z5IYiLkjf2VJA=;
	b=mv/NYXtgsa1laoPOcjYuro6HFlqXdKuBSKU+yh19ovpydhOkfSdTon8PUtmFdLvQyc
	kkseeT+rx8qbXdty4YxO/EdFJeTPQkW8z+MnOHyXqS8bOgmdD8W1wwrscXnBpOpuEhlE
	Rd8b7+PT+RkdaBnnPsqT1O3r1IsUU0JGEPJ/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=HQcWoeudmGknftJwE2rVPmajDKFMJNHBlEEZWFbHxg9qmE+3S8IbBB6gXzMPWQ9Beo
	Lpwx+IneaHA/edeSOJ3aSJW9YRE5cW9qetAFoQIO9lH2zyIsq6vKpR3izWBlZg40AF6q
	2tnaO9gdY6BqMCPI54EYJ9Yxg08OAVrV+kj84=
Received: by 10.214.184.1 with SMTP id h1mr1956157qaf.176.1227532082246;
	Mon, 24 Nov 2008 05:08:02 -0800 (PST)
Received: by 10.214.12.10 with HTTP; Mon, 24 Nov 2008 05:08:02 -0800 (PST)
Message-ID: <c384c5ea0811240508x4d870ac8m2b44679db394755d@mail.gmail.com>
Date: Mon, 24 Nov 2008 14:08:02 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <492AA454.20009@balister.org>
MIME-Version: 1.0
References: <ggd81q$re5$1@ger.gmane.org> <492A3368.4070302@dls.net>
	<ggdhia$cv4$1@ger.gmane.org> <492AA454.20009@balister.org>
Subject: Re: Bitbake r1090 (env hiding) makes my build fail.
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
X-List-Received-Date: Mon, 24 Nov 2008 13:10:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello guys,

On Mon, Nov 24, 2008 at 1:55 PM, Philip Balister <philip@balister.org> wrote:
> Koen Kooi wrote:
>> On 24-11-08 05:54, Mike (mwester) wrote:
>>> Rob Kramer wrote:
>>>> Hia,
>> Why not put
>>
>> CCACHE=""
>>
>> in local.conf?
>>
>> regards,
>>
>> Koen
>>
>> PS: Is that on a RH (derived) buildhost?
>
> I had this problem on a RHEL4 machine.
>

Q: Did this problem reproduce reliably each time?


Background: I have seen my builds-from-scratch fail very early as
well, but it does not reproduce often. In my case, I suspect a
concurrency issue, i.e. BB_NUMBER_THREADS larger than 1? It fails
every 1 out of 50 times or so here... I am still tracking that one
down.


Regards,
-- 
Leon


