Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 95BE062133
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 07:18:43 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u3F7IgYu008897
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 09:18:43 +0200
Received: from [139.16.78.53] (MD1FZU9C.ww002.siemens.net [139.16.78.53] (may
	be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u3F7Igxt000852
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 09:18:42 +0200
To: openembedded-devel@lists.openembedded.org
References: <CAOd_LFyF5A_Xp5SGVM7cQXU=w3zhPeWsWVohb2V9VDVxMLwoTA@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <571095D2.6020501@siemens.com>
Date: Fri, 15 Apr 2016 09:18:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAOd_LFyF5A_Xp5SGVM7cQXU=w3zhPeWsWVohb2V9VDVxMLwoTA@mail.gmail.com>
Subject: Re: anyone using docker for OE builds?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2016 07:18:49 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Cliff

On 15.04.2016 03:44, Cliff Brake wrote:
> Hi,
>
> I've been using systemd-nspawn containers for OE builds for some
> years, and lately have been investigating Docker.  Seems like useful
> tool, but a little concerned about managing 35GB build trees in Docker
> (I already ran my workstation out of disk space once).
>
> Does anyone have any suggestions or tips for using Docker to host OE
> builds -- especially the storage aspect?
>
>
We are using docker to build several OE based products in conjunction with GitLab CI.
The only special thing we do at the moment it that we mount the sstate and download folder as a volume into the container.
This we do mostly to save some time.

But of course you need enough space in your docker runtime directory to store the docker containers while the builds are running. After that we (actually gitlab ci) usually delete the containers and the space gets freed again.

Pascal

