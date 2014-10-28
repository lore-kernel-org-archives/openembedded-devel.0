Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-08.prod.phx3.secureserver.net
	(p3plsmtpa07-08.prod.phx3.secureserver.net [173.201.192.237])
	by mail.openembedded.org (Postfix) with ESMTP id 96644601F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 11:17:48 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-08.prod.phx3.secureserver.net with 
	id 8bHn1p00D0BVjqb01bHnbM; Tue, 28 Oct 2014 04:17:49 -0700
Message-ID: <544F7B5B.3090809@pabigot.com>
Date: Tue, 28 Oct 2014 06:17:47 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1414466854-22119-1-git-send-email-Qi.Chen@windriver.com>
	<CALbNGRTzapqQw+spUpN-iJB1Y8K9c2D7A4jo2RH=eNGsoOcQ6g@mail.gmail.com>
In-Reply-To: <CALbNGRTzapqQw+spUpN-iJB1Y8K9c2D7A4jo2RH=eNGsoOcQ6g@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] ntp: make daemon run under ntp:ntp
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
X-List-Received-Date: Tue, 28 Oct 2014 11:17:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 10/28/2014 05:46 AM, Andreas Müller wrote:
> On Tue, Oct 28, 2014 at 4:27 AM,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Fix the service so that the ntpd daemon is run under ntp:ntp.
> What does this fix?

Primarily, I suspect, it makes systemd consistent with the existing init 
script.

It also provides a reason for the previous patches that moved the 
driftfile out of /etc to a location that user ntp can write, which was 
done earlier.

Acked-by: Peter A. Bigot <pab@pabigot.com>

Peter

