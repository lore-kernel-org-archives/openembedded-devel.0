Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB7960F54
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 10:37:32 +0000 (UTC)
Message-ID: <52416B6B.5010805@communistcode.co.uk>
Date: Tue, 24 Sep 2013 11:37:31 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1380015325-28852-1-git-send-email-ml@communistcode.co.uk>
	<CAJTo0LbB3U6GjzdGyc3Ff+gNjstYdy7B3KUNAEUBLuUebDTVNQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbB3U6GjzdGyc3Ff+gNjstYdy7B3KUNAEUBLuUebDTVNQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] lm_sensors: add ALLOW_EMPTY to lmsensors and lmsensors-config
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
X-List-Received-Date: Tue, 24 Sep 2013 10:37:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24/09/13 10:52, Burton, Ross wrote:
> On 24 September 2013 10:35, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> When building with dev-pkgs enabled I was hitting an error lmsensors-dev
>> not available. Adding ALLOW_EMPTY allowed the empty package to be created
>> and therefore satisfy the dependancy.
> 
> Your ALLOW_EMPTY statements only apply to lmsensors and
> lmsensors-config, not lmsensors-dev (as you're using just ${PN}), and
> surely you don't need it on the lmsensors-config recipe at all.
> 
> Ross
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

v2 on it's way with the RDEPENDS mechanism used as discussed on IRC and
a better commit message.

