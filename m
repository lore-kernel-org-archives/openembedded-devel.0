Return-Path: <pierluigi.passaro@phoenixsoftware.it>
Received: from smtpdg10.aruba.it (smtpdg7.aruba.it [62.149.158.237])
	by mail.openembedded.org (Postfix) with ESMTP id 95D0065CE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 21:26:55 +0000 (UTC)
Received: from [192.168.1.71] ([94.33.39.20])
	by smtpcmd04.ad.aruba.it with bizsmtp
	id pxSv1o00b0S5K6601xSwEx; Thu, 11 Sep 2014 23:26:56 +0200
Message-ID: <5412139F.1060601@phoenixsoftware.it>
Date: Thu, 11 Sep 2014 23:26:55 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <54107627.9060100@phoenixsoftware.it>
	<CAP9ODKqdRy6_uoebjWjZPSDQCUOPTTpz+D1se0MmN=pRtmwirQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqdRy6_uoebjWjZPSDQCUOPTTpz+D1se0MmN=pRtmwirQ@mail.gmail.com>
Subject: Re: [meta-qt5] [daisy] qtwayland fetch fail
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
X-List-Received-Date: Thu, 11 Sep 2014 21:27:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2014 22:32, Otavio Salvador wrote:
> On Wed, Sep 10, 2014 at 1:02 PM, Pierluigi Passaro
> <pierluigi.passaro@phoenixsoftware.it> wrote:
>> Hi all,
>> working on daisy, it looks like the fetching url of qtwayland is no longer
>> available.
>>
>> The following patch helped me to solve the problem, hope it will help...
> I did a patch using 5.4 as branch, for master. Can you test if it also
> works for you?
The branch "5.4" is fine: the daisy SRCREV 
573d0ee5ba86d99095f217ea9e19172bfc5e75fd is dated March 19 and "5.4" has 
been branched from "dev" a month ago, so this SRCREV is available in both.

Please, if possible, keep alligned SRCREV in both qtwayland_git.bb and 
qtwayland-native_git.bb: in daisy, only qtwayland_git.bb was updated and 
qtwayland-native_git.bb has been kept older.

Thanks
Regards
Pierluigi

