Return-Path: <zarelaky@hotmail.com>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Feb 2015 09:06:09 UTC
Received: from BLU004-OMC4S29.hotmail.com (blu004-omc4s29.hotmail.com
	[65.55.111.168])
	by mail.openembedded.org (Postfix) with ESMTP id CE01065C97
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Feb 2015 09:06:09 +0000 (UTC)
Received: from BLU436-SMTP47 ([65.55.111.135]) by BLU004-OMC4S29.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Mon, 9 Feb 2015 01:01:07 -0800
X-TMN: [FheSLwt9TCE2r5d3YIOsQEcTzbDr1IfE]
X-Originating-Email: [zarelaky@hotmail.com]
Message-ID: <BLU436-SMTP47159D5A57AC6CDF178033DC270@phx.gbl>
Date: Mon, 9 Feb 2015 17:00:42 +0800
From: Mingtao Qu <zarelaky@hotmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 09 Feb 2015 09:01:06.0145 (UTC)
	FILETIME=[F02A5510:01D04446]
Subject: [meta-multimedia] any patch for alsa-lib pcm.c __P_OLD_NEAR1() macro bug?
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
X-List-Received-Date: Mon, 09 Feb 2015 09:06:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

hi everyone !

when i use alsa-lib, i got this bug,
the error code under below, this bug triggered in below way.
	app => libshared1.so => libasound.so
but
	app => libshared1.a => libasound.so
is fine.


#define __P_OLD_NEAR(pfx, name, ret_type) \
ret_type pfx##name(snd_pcm_t *pcm, snd_pcm_hw_params_t *params, ret_type 
val) \
{ \
	if (INTERNAL(name)(pcm, params, &val) < 0) \ //!!!!!HERE
		return 0; \
	return (ret_type)val; \
}

#define __P_OLD_NEAR1(pfx, name, ret_type) \
ret_type pfx##name(snd_pcm_t *pcm, snd_pcm_hw_params_t *params, ret_type 
val, int *dir) \
{ \
	if (INTERNAL(name)(pcm, params, &val, dir) < 0) \ //!!!!!HERE
		return 0; \
	return (ret_type)val; \
}

#define __OLD_NEAR(name, ret_type) __P_OLD_NEAR(__old_, name, ret_type)
#define __OLD_NEAR1(name, ret_type) __P_OLD_NEAR1(__old_, name, ret_type)

__OLD_NEAR(snd_pcm_hw_params_set_channels_near, unsigned int);
__OLD_NEAR1(snd_pcm_hw_params_set_rate_near, unsigned int);
__OLD_NEAR1(snd_pcm_hw_params_set_period_time_near, unsigned int);
__OLD_NEAR1(snd_pcm_hw_params_set_period_size_near, snd_pcm_uframes_t);
__OLD_NEAR1(snd_pcm_hw_params_set_periods_near, unsigned int);
__OLD_NEAR1(snd_pcm_hw_params_set_buffer_time_near, unsigned int);
__OLD_NEAR(snd_pcm_hw_params_set_buffer_size_near, snd_pcm_uframes_t);
__OLD_NEAR1(snd_pcm_hw_params_set_tick_time_near, unsigned int);

